library(mcsm)


### Name: SAmix
### Title: Graphical representation of the simulated annealing sequence for
###   the mixture posterior
### Aliases: SAmix
### Keywords: optimize hplot

### ** Examples

da=sample(rbind(rnorm(10^2),2.5+rnorm(3*10^2)))
SAres=SAmix(x=c(-.3,.6),tol=10^(-2),fac=.1)



