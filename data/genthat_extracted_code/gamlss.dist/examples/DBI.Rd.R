library(gamlss.dist)


### Name: DBI
### Title: The Double binomial distribution
### Aliases: DBI pDBI dDBI qDBI rDBI GetBI_C
### Keywords: distribution regression

### ** Examples

DBI()
x <- 0:20
# underdispersed DBI
plot(x, dDBI(x, mu=.5, sigma=.2, bd=20), type="h", col="green", lwd=2)
# binomial
lines(x+0.1, dDBI(x, mu=.5, sigma=1, bd=20), type="h", col="black", lwd=2)
# overdispersed DBI
lines(x+.2, dDBI(x, mu=.5, sigma=2, bd=20), type="h", col="red",lwd=2)



