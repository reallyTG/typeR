library(networkGen)


### Name: netHTML1arrow
### Title: Generate Network Maze (1 arrow)
### Aliases: netHTML1arrow

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
netHTML1arrow(logic, wd=NULL, names = countries,concerto="C5")





