library(mazeGen)


### Name: mazeObject
### Title: Generate Elithorn Maze
### Aliases: mazeObject

### ** Examples


rank <- 3
satPercent <- 0.5

#Grid must be same as rank
grid <- gridThreeUp

#Generate item
mazeObject(rank,satPercent,seed=5,grid = grid,
background="#7abcff",boxBackground="#66CDAA", fontColour="white ",
Timer=TRUE, concerto="C5")






