library(planor)


### Name: planor.factors
### Title: Create an Object of Class designfactors
### Aliases: planor.factors
### Keywords: design

### ** Examples
planor.factors(c("A","B","C","P"),c(2,3,6,3))
planor.factors(LETTERS[1:12],2)
planor.factors(12,2)
planor.factors( c("A","B","Block"), 3, block=~Block)
zz <- planor.factors( c("A","B","Block"), c(2,3,5))
zz@levels$A <- c("plus","moins")
planor.factors(factors=list(A=c("plus","moins"), B=1:3, Block=1:5))
AB <- data.frame( A=c(rep(c("a","b"),3)), B=rep(c("z","zz","zzz"),rep(2,3)), C=1:6)
planor.factors(factors=AB)


