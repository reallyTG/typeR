library(Epi)


### Name: twoby2
### Title: Analysis of a two by two table
### Aliases: twoby2
### Keywords: univar htest

### ** Examples

Treat <- sample(c("A","B"), 50, rep=TRUE )
Resp <- c("Yes","No")[1+rbinom(50,1,0.3+0.2*(Treat=="A"))]
twoby2( Treat, Resp )                 
twoby2( table( Treat, Resp )[,2:1] ) # Comparison the other way round



