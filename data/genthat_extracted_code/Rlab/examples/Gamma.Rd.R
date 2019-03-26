library(Rlab)


### Name: Gamma
### Title: The Gamma Distribution
### Aliases: Gamma dgamma pgamma qgamma rgamma
### Keywords: distribution

### ** Examples

-log(dgamma(1:4, alpha=1))
p <- (1:9)/10
pgamma(qgamma(p,alpha=2), alpha=2)
1 - 1/exp(qgamma(p, alpha=1))



