library(FamEvent)


### Name: plot.penmodel
### Title: Plot method for 'penmodel'
### Aliases: plot.penmodel
### Keywords: Penetrance plot

### ** Examples


# Simulated family data  

fam <- simfam(N.fam=300, design="pop+", base.dist="Weibull", variation="none",
       base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), allelefreq=0.02, agemin=20)
 
# Fit family data

fit <- penmodel(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, 
       design="pop+", base.dist="Weibull")
       
# Plot penetrance function curves

plot(fit)
	



