library(inarmix)


### Name: GenerateMixData
### Title: Generates simulated data according to a specified INAR mixture
###   model.
### Aliases: GenerateMixData
### Keywords: datagen

### ** Examples

XX <- cbind(rep(1,9),c(0:8)/4)
colnames(XX) <- c("const","time")
coefs <- rbind(c(-.2,0),c(1.2,.3))
autocorr <- c(.2,.2)
scale <- c(1.5,1.5)
mix.prop <- c(.8,.2)

testdat <- GenerateMixData(1000,coefs,autocorr,scale,mix.prop,XX)



