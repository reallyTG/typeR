library(distrMod)


### Name: onesidedBias-class
### Title: onesided Bias Type
### Aliases: onesidedBias-class sign sign<- sign,onesidedBias-method
###   sign<-,onesidedBias-method
### Keywords: classes

### ** Examples

positiveBias()
## The function is currently defined as
function(){ new("onesidedBias", name = "positive Bias", sign = 1) }

negativeBias()
## The function is currently defined as
function(){ new("onesidedBias", name = "negative Bias", sign = -1) }

pB <- positiveBias()
sign(pB)
try(sign(pB) <- -2) ## error
sign(pB) <- -1



