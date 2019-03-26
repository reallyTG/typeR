library(FamEvent)


### Name: plot.simfam
### Title: Plot method for 'simfam' or Plot pedigrees
### Aliases: plot.simfam
### Keywords: Pedigree plot

### ** Examples


# Simulated family data

fam <- simfam(N.fam=300, design="pop+", base.dist="Weibull", allelefreq=0.02, 
       base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), agemin=20)
 
# Pedigree plots for first three simulated families

plot(fam, famid=c(1:3), pdf=TRUE, file="pedigrees.pdf")
	



