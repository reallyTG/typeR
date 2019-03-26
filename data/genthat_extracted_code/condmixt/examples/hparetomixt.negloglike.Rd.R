library(condmixt)


### Name: hparetomixt.negloglike
### Title: Maximum Likelihood Estimation for a Mixture of Hybrid Paretos
### Aliases: hparetomixt.negloglike hparetomixt.fit hparetomixt.cvtrain

### ** Examples

r <- rfrechet(500,loc=5,scale=5,shape=5)
m <- 2
param.init <- hparetomixt.init(m,r)
hparetomixt.negloglike(param.init,r)
hparetomixt.fit(param.init,r)



