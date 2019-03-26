library(networkGen)


### Name: netHTML3arrows
### Title: Generate Network Maze (3 arrows)
### Aliases: netHTML3arrows

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
netHTML3arrows(logic, wd=NULL, names = countries,concerto="C5")





