library(StratSel)


### Name: makeDyadic
### Title: A Function To Create Dyadic Data Sets
### Aliases: makeDyadic
### Keywords: Creating dyadic datasets

### ** Examples

dataOrig <- matrix(c( rep(c(1:4),3), rep(1,4), rep(2,4), rep(3,4),
 rnorm(4,1.5,0.1), rnorm(4,2.5,0.1), rnorm(4,3.5,0.1), rnorm(4,4.5,0.1),
 rnorm(4,5.5,0.1), rnorm(4,6.5,0.1)),12,4)
colnames(dataOrig) <- c("countryCODE", "Year", "Variable 1", "Variable 2")
dataNew <- makeDyadic(dataOrig, directed=TRUE)



