library(berryFunctions)


### Name: seqR
### Title: seq with a range argument
### Aliases: seqR
### Keywords: datagen

### ** Examples


seqR(range=c(12,6), by=-2)
m <- c(41, 12, 38, 29, 50, 39, 22)
seqR(m, len=6)
# Takes min and max of range if the vector has more than two elements.

seqR(range=c(12,6), by=-2, extend=0.1)
# internaly calls extendrange with f=extend




