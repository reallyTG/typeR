library(BayesGOF)


### Name: DS.sampler
### Title: Samples data from DS(G,m) distribution.
### Aliases: DS.sampler DS.sampler.post rPPD.ds

### ** Examples

##Extracted parameters from rat.ds object
rat.g.par <- c(2.3, 14.1)
rat.LP.par <- c(0, 0, -0.5)
samps.prior <- DS.sampler(25, rat.g.par, rat.LP.par, con.prior = "Beta")
hist(samps.prior,15)
##Posterior for rat data
samps.post <- DS.sampler.post(25, rat.g.par, rat.LP.par, 
							y.0 = 4, n.0 = 14, con.prior = "Beta")
hist(samps.post, 15)



