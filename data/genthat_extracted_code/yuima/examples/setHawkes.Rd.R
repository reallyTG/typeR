library(yuima)


### Name: setHawkes
### Title: Constructor of Hawkes model
### Aliases: setHawkes

### ** Examples

## Not run: 
##D # Definition of an univariate hawkes model
##D 
##D provaHawkes2<-setHawkes()
##D str(provaHawkes2)
##D 
##D # Simulation
##D 
##D true.par <- list(nu1=0.5, c11=3.5,  a11=4.5)
##D 
##D simprv1 <- simulate(object = provaHawkes2, true.parameter = true.par,
##D   sampling = setSampling(Terminal =70, n=7000))
##D 
##D plot(simprv1)
##D 
##D # Computation of intensity
##D 
##D lambda1 <- Intensity.PPR(simprv1, param = true.par)
##D 
##D plot(lambda1)
##D 
##D # qmle
##D 
##D res1 <- qmle(simprv1, method="Nelder-Mead", start = true.par)
##D 
##D summary(res1)
## End(Not run)



