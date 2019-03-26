library(condmixt)


### Name: hparetomixt.disp
### Title: Display the Hybrid Pareto Mixture Parameters
### Aliases: hparetomixt.disp

### ** Examples

r <- rfrechet(500,loc=5,scale=5,shape=5)
m <- 2
param.init <- hparetomixt.init(m,r)
hparetomixt.disp(param.init)



