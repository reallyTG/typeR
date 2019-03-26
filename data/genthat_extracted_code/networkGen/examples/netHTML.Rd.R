library(networkGen)


### Name: netHTML
### Title: Generate Network Maze (No arrows)
### Aliases: netHTML

### ** Examples


#create node logic
logic <- nodeLogic(value = 8, type= "circuit", itemFamily= 1)

#Folder to save html/
#setwd("~/desktop")
#filePath<- getwd()

#Generate item
set.seed(1)
netHTML(logic, wd=NULL, names=NULL, concerto="C5")





