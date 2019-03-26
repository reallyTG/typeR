library(FAdist)


### Name: GenPARETO
### Title: Generalized Pareto Distribution
### Aliases: dgp pgp qgp rgp
### Keywords: distribution

### ** Examples

x <- rgp(1000,-.2,10)
hist(x,freq=FALSE,col='gray',border='white')
curve(dgp(x,-.2,10),add=TRUE,col='red4',lwd=2)



