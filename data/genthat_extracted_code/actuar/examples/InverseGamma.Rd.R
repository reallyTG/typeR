library(actuar)


### Name: InverseGamma
### Title: The Inverse Gamma Distribution
### Aliases: InverseGamma dinvgamma pinvgamma qinvgamma rinvgamma minvgamma
###   levinvgamma mgfinvgamma
### Keywords: distribution

### ** Examples

exp(dinvgamma(2, 3, 4, log = TRUE))
p <- (1:10)/10
pinvgamma(qinvgamma(p, 2, 3), 2, 3)
minvgamma(-1, 2, 2) ^ 2
levinvgamma(10, 2, 2, order = 1)
mgfinvgamma(-1, 3, 2)



