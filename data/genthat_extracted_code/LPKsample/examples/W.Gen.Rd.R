library(LPKsample)


### Name: W.Gen
### Title: Similarity matrix based on eLP basis and polynomial kernel
### Aliases: W.Gen
### Keywords: GLP other functions

### ** Examples

#example: 6 observations on 3 features:
 x<-rbind(matrix(runif(9),3,3),matrix(runif(9)+1,3,3))
#LP similarity matrix:
 simmat<-W.Gen(x,1)$W
 image(simmat)



