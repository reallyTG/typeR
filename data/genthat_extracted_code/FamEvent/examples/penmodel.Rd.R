library(FamEvent)


### Name: penmodel
### Title: Estimate the penetrance model and penetrance curves
### Aliases: penmodel
### Keywords: Penetrance model

### ** Examples


# Family data simulated from population-based design using a Weibull baseline hazard 

fam <- simfam(N.fam=300, design="pop+", variation="none", base.dist="Weibull", 
       base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), agemin=20, allelefreq=0.02)
 
# Penetrance model fit for simulated family data

fit <- penmodel(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, 
       design="pop+", base.dist="Weibull")

# Summary of the model parameter and penetrance estimates from model fit

summary(fit)

# Generate the lifetime penetrance curves from model fit for specific gender and 
# mutation status groups along with their non-parametric penetrance curves 
     
plot(fit)




