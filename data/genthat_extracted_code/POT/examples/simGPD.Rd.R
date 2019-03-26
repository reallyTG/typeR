library(POT)


### Name: Generalized Pareto
### Title: The Generalized Pareto Distribution
### Aliases: rgpd dgpd qgpd pgpd
### Keywords: distribution

### ** Examples

dgpd(0.1)
rgpd(100, 1, 2, 0.2)
qgpd(seq(0.1, 0.9, 0.1), 1, 0.5, -0.2)
pgpd(12.6, 2, 0.5, 0.1)
##for non conditional quantiles
qgpd(seq(0.9, 0.99, 0.01), 1, 0.5, -0.2, lambda = 0.9)
pgpd(2.6, 2, 2.5, 0.25, lambda = 0.5)



