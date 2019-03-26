library(tgp)


### Name: predict.tgp
### Title: Predict method for Treed Gaussian process models
### Aliases: predict.tgp
### Keywords: nonparametric nonlinear smooth models spatial tree

### ** Examples

## revisit the Motorcycle data
require(MASS)

## fit a btgpllm without predictive sampling (for speed)
out <- btgpllm(X=mcycle[,1], Z=mcycle[,2], bprior="b0", 
	       pred.n=FALSE)
## nothing to plot here because there is no predictive data

## save the "tgp" class output object for use later and
save(out, file="out.Rsave")

## then remove it (for illustrative purposes)
out <- NULL

## (now imagine emailing the out.Rsave file to a friend who
## then performs the following in order to use your fitted
## tgp model on his/her own predictive locations)

## load in the "tgp" class object we just saved
load("out.Rsave")

## new predictive locations
XX <- seq(2.4, 56.7, length=200)

## now obtain kriging estimates from the MAP model
out.kp <- predict(out, XX=XX, pred.n=FALSE)
plot(out.kp, center="km", as="ks2")

## actually obtain predictive samples from the MAP
out.p <- predict(out, XX=XX, pred.n=FALSE, BTE=c(0,1000,1))
plot(out.p)

## use the MAP as a jumping-off point for more sampling
out2 <- predict(out, XX, pred.n=FALSE, BTE=c(0,2000,2),
                MAP=FALSE, verb=1)
plot(out2)

## (generally you would not want to remove the file)
unlink("out.Rsave")



