library(distrMod)


### Name: asymmetricBias-class
### Title: asymmetric Bias Type
### Aliases: asymmetricBias-class nu,asymmetricBias-method
###   nu<-,asymmetricBias-method nu nu<-
### Keywords: classes

### ** Examples

asymmetricBias()
## The function is currently defined as
function(){ new("asymmetricBias", name = "asymmetric Bias", nu = c(1,1)) }

aB <- asymmetricBias()
nu(aB)
try(nu(aB) <- -2) ## error
nu(aB) <- c(0.3,1)



