library(ResistorArray)


### Name: SquaredSquare
### Title: A Squared square
### Aliases: SquaredSquare squaredsquare Squaredsquare
### Keywords: datasets

### ** Examples

data(SquaredSquare)
resistance(SquaredSquare,1,13) # should be 1

circuit(L=SquaredSquare,currents=c(NA,rep(0,11),1),v=c(0,rep(NA,12)))$potentials
# should be in increasing order




