library(carcass)


### Name: ettersonEq14v2
### Title: Equation 14 of Etterson (2013) Ecological Applications 23,
###   1915-1925, adapted so that persistence probability and searcher
###   efficiency can vary with age of the carcass
### Aliases: ettersonEq14v2
### Keywords: methods misc

### ** Examples

J <- c(2,3,2,4,3,5,3,2,3,4)
s <- plogis(seq(0.2, 2, length=sum(J)))
f <- plogis(seq(1.5, 0.9, length=length(J)))
ettersonEq14v2(s,f,J)



