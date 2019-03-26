library(kSamples)


### Name: pp.kSamples
### Title: Upper Tail Probability Plots for Objects of Class kSamples
### Aliases: pp.kSamples
### Keywords: nonparametric htest

### ** Examples

qn.out <- qn.test(c(1,3,7,2,9),c(1,4,6,11,2),test="KW",
		method="simulated",dist=TRUE,Nsim=1000) 
pp.kSamples(qn.out)



