library(condmixt)


### Name: hparetomixt.negloglike.tailpen
### Title: Maximum Likelihood Estimation for a Mixture of Hybrid Paretos
###   with Tail Penalty
### Aliases: hparetomixt.negloglike.tailpen hparetomixt.fit.tailpen
###   hparetomixt.cvtrain.tailpen

### ** Examples

r <- rfrechet(500,loc=5,scale=5,shape=5)
m <- 2
param.init <- hparetomixt.init(m,r)
hparetomixt.negloglike.tailpen(param.init,10,0.5,20,0.1,0.2,r)
hparetomixt.fit.tailpen(param.init,10,0.5,20,0.1,0.2,r)
hparetomixt.cvtrain.tailpen(2,10,0.5,20,0.1,0.2,r)



