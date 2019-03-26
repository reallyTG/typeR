library(gMCP)


### Name: generateWeights
### Title: generateWeights
### Aliases: generateWeights
### Keywords: htest

### ** Examples


 g <- matrix(c(0,0,1,0,
               0,0,0,1,
               0,1,0,0,
               1,0,0,0), nrow = 4,byrow=TRUE)
 ## Choose weights
 w <- c(.5,.5,0,0)
 ## Weights of conventional gMCP test:
 generateWeights(g,w)
 
g <- Entangled2Maurer2012()
generateWeights(g)




