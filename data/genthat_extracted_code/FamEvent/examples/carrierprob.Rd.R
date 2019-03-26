library(FamEvent)


### Name: carrierprob
### Title: Compute mutation carrier probabilities for individuals with
###   missing gentoypes
### Aliases: carrierprob
### Keywords: Carrier probability

### ** Examples


# Simulated family data with 30% of members missing their genetic information.

fam <- simfam(N.fam=100, design="pop+", base.dist="Weibull", mrate=0.3,
       base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), agemin=20)
 
# EM algorithm for fitting family data with missing genotypes assuming a Weibull
# baseline hazard and dominant mode of Mendelian inheritance for a major gene.

fitEM <- penmodelEM(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, design="pop+",
       base.dist="Weibull", method="mendelian", mode="dominant")

# Carrier probability obtained by conditioning on the observed genotypes and phenotype, 
# assuming a dominant Mendelian mode of inheritance

fam.added <- carrierprob(condition="geno+pheno", method="model", fit=fitEM, data=fam, 
             mode="dominant", q=0.02)

# pedigree plot for family 1 displaying carrier probabilities

plot.simfam(fam.added, famid=1)




