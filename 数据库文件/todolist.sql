/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : todolist

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-11-09 14:54:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement` (
  `archievement_id` mediumint(16) NOT NULL,
  `archievement_code` tinyint(16) NOT NULL,
  `archievement_yiban_fk` varchar(128) NOT NULL,
  `archievement_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`archievement_id`),
  KEY `archievement_yiban_fk` (`archievement_yiban_fk`),
  CONSTRAINT `achievement_ibfk_1` FOREIGN KEY (`archievement_yiban_fk`) REFERENCES `userinfo` (`yiban_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of achievement
-- ----------------------------

-- ----------------------------
-- Table structure for memo
-- ----------------------------
DROP TABLE IF EXISTS `memo`;
CREATE TABLE `memo` (
  `memo_id` mediumint(16) NOT NULL AUTO_INCREMENT,
  `memo_description` varchar(255) NOT NULL,
  `memo_time` datetime NOT NULL,
  `memo_yiban_fk` varchar(128) NOT NULL,
  PRIMARY KEY (`memo_id`),
  KEY `memo_yiban_fk` (`memo_yiban_fk`),
  CONSTRAINT `memo_ibfk_1` FOREIGN KEY (`memo_yiban_fk`) REFERENCES `userinfo` (`yiban_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memo
-- ----------------------------
INSERT INTO `memo` VALUES ('1', '666', '2018-08-22 17:30:15', 'a3');

-- ----------------------------
-- Table structure for subtask
-- ----------------------------
DROP TABLE IF EXISTS `subtask`;
CREATE TABLE `subtask` (
  `subtask_id` mediumint(16) NOT NULL AUTO_INCREMENT,
  `subtask_name` varchar(32) NOT NULL,
  `subtask_yiban_fk` varchar(128) NOT NULL,
  `subtask_task_fk` mediumint(16) NOT NULL,
  `subtask_flag` tinyint(16) NOT NULL,
  PRIMARY KEY (`subtask_id`),
  KEY `subtask_yiban_fk` (`subtask_yiban_fk`),
  KEY `subtask_task_fk` (`subtask_task_fk`),
  CONSTRAINT `subtask_ibfk_1` FOREIGN KEY (`subtask_yiban_fk`) REFERENCES `userinfo` (`yiban_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subtask_ibfk_2` FOREIGN KEY (`subtask_task_fk`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subtask
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` mediumint(16) NOT NULL AUTO_INCREMENT,
  `task_yiban_fk` varchar(128) NOT NULL,
  `task_list_fk` mediumint(128) NOT NULL,
  `task_name` varchar(32) NOT NULL,
  `task_description` varchar(128) NOT NULL,
  `task_begin_time` datetime NOT NULL,
  `task_deadline` datetime NOT NULL,
  `task_finish_time` datetime DEFAULT NULL,
  `task_finish_flag` tinyint(4) NOT NULL,
  `task_overdue` tinyint(4) NOT NULL,
  `task_score` float(16,0) DEFAULT NULL,
  `task_rewards` varchar(128) NOT NULL,
  `task_priority` varchar(128) NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `task_yiban_fk` (`task_yiban_fk`),
  KEY `task_list_fk` (`task_list_fk`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`task_yiban_fk`) REFERENCES `userinfo` (`yiban_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`task_list_fk`) REFERENCES `tasks_list` (`list_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('4', 'a1', '3', 'ajax测试', '测试ajax', '2018-10-29 10:04:00', '2018-10-30 10:09:00', '2018-11-08 20:32:20', '1', '1', '90', '无', '不重要-很紧急');
INSERT INTO `task` VALUES ('30', 'a1', '5', 'nice 啊', '啦啦啦', '2018-11-07 08:44:00', '2018-11-08 08:49:00', '2018-11-08 20:32:42', '1', '1', '70', '不清楚', '不重要-很紧急');
INSERT INTO `task` VALUES ('35', 'a1', '3', '花与爱丽丝', '嗡嗡嗡', '2018-11-08 20:33:00', '2018-11-09 19:33:00', '2018-11-08 20:37:15', '1', '0', '40', '犹大', '很重要-很紧急');
INSERT INTO `task` VALUES ('36', 'a1', '3', 'nice', 'www', '2018-11-08 20:39:00', '2018-11-09 16:39:00', '2018-11-08 20:40:30', '1', '0', '70', 'www', '很重要-很紧急');
INSERT INTO `task` VALUES ('37', 'a1', '3', 'hhh', 'www', '2018-11-08 19:45:00', '2018-11-11 04:45:00', '2018-11-08 20:46:05', '1', '0', '40', 'mmm', '很重要-很紧急');
INSERT INTO `task` VALUES ('38', 'a1', '3', '爱丽丝', 'waa', '2018-11-08 19:48:00', '2018-11-11 21:48:00', '2018-11-08 20:49:28', '1', '0', '80', '汪汪汪', '很重要-不紧急');
INSERT INTO `task` VALUES ('39', 'a1', '3', 'ww', 'wwaaa', '2018-11-08 06:59:00', '2018-11-10 20:59:00', '2018-11-08 21:05:10', '1', '0', '70', 'w', '不重要-很紧急');
INSERT INTO `task` VALUES ('40', 'a1', '3', '成功了', 'aaa', '2018-11-08 21:05:00', '2018-11-15 12:06:00', '2018-11-08 21:06:08', '1', '0', '40', '嗡嗡嗡', '很重要-很紧急');
INSERT INTO `task` VALUES ('41', 'a1', '3', '超时任务', '顶顶顶', '2018-11-05 21:14:00', '2018-11-07 08:14:00', '2018-11-08 21:15:18', '1', '1', '60', '无', '很重要-很紧急');
INSERT INTO `task` VALUES ('42', 'a1', '3', '未超时任务', '顶顶顶', '2018-11-05 21:14:00', '2018-11-16 08:14:00', '2018-11-08 21:15:29', '1', '0', '80', '无', '很重要-很紧急');
INSERT INTO `task` VALUES ('43', 'a1', '3', 'jjj', 'jh', '2018-11-08 21:16:00', '2018-11-16 16:16:00', '2018-11-08 21:17:28', '1', '0', '70', 'j', '很重要-很紧急');
INSERT INTO `task` VALUES ('44', 'a1', '3', 'jjj(超时)', 'jh', '2018-11-05 21:16:00', '2018-11-06 16:16:00', '2018-11-08 21:17:42', '1', '1', '20', 'j', '很重要-很紧急');
INSERT INTO `task` VALUES ('45', 'a1', '3', 'wawe', 'aa', '2018-11-08 21:22:00', '2018-11-15 06:22:00', '2018-11-08 21:25:56', '1', '0', '40', 'ww', '很重要-很紧急');
INSERT INTO `task` VALUES ('46', 'a1', '3', '1234', '77777', '2018-11-09 16:48:00', '2018-11-10 18:25:00', null, '0', '0', null, '111', '很重要-很紧急');

-- ----------------------------
-- Table structure for tasks_list
-- ----------------------------
DROP TABLE IF EXISTS `tasks_list`;
CREATE TABLE `tasks_list` (
  `list_id` mediumint(16) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(32) NOT NULL,
  `list_yiban_fk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `list_set_fk` mediumint(128) NOT NULL,
  `list_flag` tinyint(16) NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `list_yiban_fk` (`list_yiban_fk`),
  KEY `list_set_fk` (`list_set_fk`),
  CONSTRAINT `tasks_list_ibfk_1` FOREIGN KEY (`list_yiban_fk`) REFERENCES `userinfo` (`yiban_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_list_ibfk_2` FOREIGN KEY (`list_set_fk`) REFERENCES `tasks_set` (`set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasks_list
-- ----------------------------
INSERT INTO `tasks_list` VALUES ('3', '任务列表', 'a1', '15', '0');
INSERT INTO `tasks_list` VALUES ('4', '任务列表2', 'a1', '21', '0');
INSERT INTO `tasks_list` VALUES ('5', '任务列表3', 'a1', '15', '0');

-- ----------------------------
-- Table structure for tasks_set
-- ----------------------------
DROP TABLE IF EXISTS `tasks_set`;
CREATE TABLE `tasks_set` (
  `set_id` mediumint(16) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(32) NOT NULL,
  `set_yiban_fk` varchar(128) NOT NULL,
  `set_create_time` datetime NOT NULL,
  `set_description` varchar(255) DEFAULT NULL,
  `set_flag` tinyint(16) NOT NULL,
  PRIMARY KEY (`set_id`),
  KEY `set_yiban_fk` (`set_yiban_fk`),
  CONSTRAINT `tasks_set_ibfk_1` FOREIGN KEY (`set_yiban_fk`) REFERENCES `userinfo` (`yiban_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasks_set
-- ----------------------------
INSERT INTO `tasks_set` VALUES ('15', '修改任务集', 'a1', '2018-08-26 15:42:35', '无', '1');
INSERT INTO `tasks_set` VALUES ('21', '同步测试1', 'a1', '2018-08-27 14:18:37', '无', '0');
INSERT INTO `tasks_set` VALUES ('22', '同步测试2', 'a1', '2018-08-27 14:18:38', '无', '0');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `yiban_id` varchar(128) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_nickname` varchar(128) DEFAULT NULL,
  `user_sex` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`yiban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('a1', 'reol', '嘻', 'woman');
INSERT INTO `userinfo` VALUES ('a2', '谢老板', null, null);
INSERT INTO `userinfo` VALUES ('a3', '李劲言', null, null);
INSERT INTO `userinfo` VALUES ('null', 'null', null, null);
SET FOREIGN_KEY_CHECKS=1;
