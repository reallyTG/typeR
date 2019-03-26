library(condmixt)


### Name: gaussmixt.init
### Title: Provides initial values for the parameters of a mixture of
###   Gaussians based on a sample.
### Aliases: gaussmixt.init

### ** Examples

r <- rfrechet(500,loc=5,scale=5,shape=10)
m <- 2
param.init <- gaussmixt.init(2,r)



