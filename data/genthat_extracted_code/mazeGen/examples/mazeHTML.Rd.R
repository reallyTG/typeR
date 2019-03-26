library(mazeGen)


### Name: mazeHTML
### Title: Generate Elithorn Maze
### Aliases: mazeHTML

### ** Examples


rank <- 3
satPercent <- 0.5

#Grid must be same as rank
grid <- gridThreeUp

#Folder to save html/
#setwd("~/desktop")
#filePath<- getwd()

#Generate item
mazeHTML(rank,satPercent,seed=5,grid = grid,wd=NULL,
background="#7abcff",boxBackground="#66CDAA", fontColour="white ",
Timer=TRUE, concerto="C5")




