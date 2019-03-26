library(networkGen)


### Name: netHTML2arrows
### Title: Generate Network Maze (2 arrows)
### Aliases: netHTML2arrows

### ** Examples

#create random names
countries <- c("Croatia","Cyprus","Denmark","Finland","France","Germany",
"Greece","Hungary","Iceland","UK","US")

#create node logic
logic <- nodeLogic(value = 8, type= "circuit", itemFamily= 1)

#Folder to save html/
#setwd("~/desktop")
#filePath<- getwd()

#Generate item
set.seed(1)
netHTML2arrows(logic, wd=NULL, names = countries,concerto="C5")





