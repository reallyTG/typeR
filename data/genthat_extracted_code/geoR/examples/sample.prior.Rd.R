library(geoR)


### Name: sample.prior
### Title: Sample the prior distribution
### Aliases: sample.prior
### Keywords: spatial distribution

### ** Examples

sample.prior(50, 
             prior=prior.control(beta.prior = "normal", beta = .5, beta.var.std=0.1, 
                                 sigmasq.prior="sc", sigmasq=1.2, df.sigmasq= 2, 
                                 phi.prior="rec", phi.discrete = seq(0,2, l=21)))



