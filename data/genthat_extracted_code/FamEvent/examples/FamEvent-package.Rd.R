library(FamEvent)


### Name: FamEvent-package
### Title: Family age-at-onset data simulation and penetrance estimation
### Aliases: FamEvent-package
### Keywords: package

### ** Examples


#  Simulate family data 

fam <- simfam(N.fam=100, design="pop+", variation="none", base.dist="Weibull", 
       base.parms=c(0.01, 3), vbeta=c(-1.13, 2.35), allelefreq=0.02)

# summary of simulated family data

summary(fam) 

# Pedigree plots for family 1 and 2

plot(fam, famid=c(1,2))

# penetrance function plots given model parameter values for Weibull baseline 

penplot(base.parms=c(0.01,3), vbeta=c(-1.3, 2.35), base.dist="Weibull", 
        variation="none", agemin=20)

# model fit of family data 

fit <- penmodel(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, 
       design="pop+", base.dist="Weibull")

# summary of estimated model parameters and penetrance estimates 

summary(fit)

# penetrance curves useful for model checking 

plot(fit) 




