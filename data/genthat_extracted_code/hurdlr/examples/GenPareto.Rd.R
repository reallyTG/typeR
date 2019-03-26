library(hurdlr)


### Name: GenPareto
### Title: The Generalized Pareto Distribution
### Aliases: GenPareto dgpd mgpd pgpd qgpd rgpd

### ** Examples

dexp(1,rate=.5) #Exp(rate) equivalent to gpd with mu=0 AND xi=0, and sigma=1/rate.
dgpd(1,mu=0,sigma=2,xi=0) #cannot take xi=0.
dgpd(1,mu=0,sigma=2,xi=0.0000001) #but can get close.

##"mass" function of GPD
mgpd(8) == pgpd(8.5) - pgpd(7.5)



