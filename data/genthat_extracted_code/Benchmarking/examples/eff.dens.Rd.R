library(Benchmarking)


### Name: eff.dens
### Title: Estimate and plot density of efficiencies
### Aliases: eff.dens eff.dens.plot

### ** Examples

e <- 1 - rnorm(100)
e[e>1] <- 1
e <- e[e>0]
eff.dens.plot(e)

hist(e, breaks=15, freq=FALSE, xlab="Efficiency", main="")
den <- eff.dens(e)
lines(den,lw=2)



