library(FamEvent)


### Name: penmodelEM
### Title: EM algorithm for estimating the penetrance model with missing
###   genotypes
### Aliases: penmodelEM
### Keywords: Penetrance model

### ** Examples


# Family data simulated with 30% of members missing their genetic information.

fam <- simfam(N.fam=100, design="pop+", base.dist="Weibull", base.parms=c(0.01,3),
       vbeta=c(-1.13, 2.35), agemin=20, allelefreq=0.02, mrate=0.3)
 
# EM algorithm for fitting family data with missing genotypes

fit <- penmodelEM(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, design="pop+",
       base.dist="Weibull", method="mendelian", mode="dominant", q=NULL)

# Summary of the model parameter and penetrance estimates from model fit 
# by penmodelEM 

summary(fit)

# Generate the lifetime penetrance curves from model fit for gender and 
# mutation status groups along with their non-parametric penetrance curves 
# based on observed data
 
plot(fit)




