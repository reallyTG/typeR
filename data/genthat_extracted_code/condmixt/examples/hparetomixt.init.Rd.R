library(condmixt)


### Name: hparetomixt.init
### Title: Provides initial values for the parameters of a mixture of
###   hybrid Paretos based on a sample.
### Aliases: hparetomixt.init

### ** Examples

r <- rfrechet(500,loc=5,scale=5,shape=5)
m <- 2
param.init <- hparetomixt.init(m,r)



