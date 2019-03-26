library(cubing)


### Name: scramble
### Title: Generate Random Cubes, Moves and Scrambles
### Aliases: scramble randCube randMoves
### Keywords: distribution

### ** Examples

randCube()
getMovesCube(randMoves())
sapply(randCube(20, solvable = FALSE), is.solvable)
randMoves(5, nm = 25)
scramble(nm = 17)
scramble(state = TRUE, type = "ZT", maxMoves = 24)



