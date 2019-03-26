library(ftnonpar)


### Name: smdenreg
### Title: Piecewise monotone density estimation with smooth taut strings
### Aliases: smdenreg
### Keywords: smooth nonparametric models

### ** Examples

y <- rclaw(500)
hist(y,col="lightgrey",40,freq=FALSE)
lines(smdenreg(y),col="red")



