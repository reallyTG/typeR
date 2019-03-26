library(eefAnalytics)


### Name: mlmBayes
### Title: Bayesia multilevel analysis of randomised educatuon trials using
###   vague priors.
### Aliases: mlmBayes

### ** Examples

if(interactive()){
  
data(crtData)

########################################################
## Bayesian analysis of cluster randomised trials     ##
########################################################

output <- mlmBayes(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",nSim=10000,data=crtData)

### Fixed effects
beta <- output$Beta
beta

### Effect size
ES1 <- output$ES
ES1

## Covariance matrix
covParm <- output$covParm
covParm

### plot random effects for schools

plot(output)

### plot posterior probability of an effect size to be bigger than a pre-specified threshold

plot(output,group=1)
}



