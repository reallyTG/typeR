library(ASPBay)


### Name:  ASP.Bayesian 
### Title: Samples in the posterior distribution of the frequencies and OR
### Aliases: ' ASP.Bayesian '
### Keywords: Metropolis-Hasting Sampling

### ** Examples

data(ASPData)
B <- ASP.Bayesian(1e5, ASPData$Control, ASPData$Index,
                  ASPData$IBD, 15 )



