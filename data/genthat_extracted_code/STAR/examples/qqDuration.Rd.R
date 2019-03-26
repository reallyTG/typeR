library(STAR)


### Name: qqDuration
### Title: Quantile-Quantile Plot For Fitted Duration Distributions
### Aliases: qqDuration
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## Simulate a sample with 100 events from an inverse Gaussian
##D set.seed(1102006,"Mersenne-Twister")
##D mu.true <- 0.075
##D sigma2.true <- 3
##D sampleSize <- 100
##D sampIG <- rinvgauss(sampleSize,mu=mu.true,sigma2=sigma2.true)
##D ## Fit it with an inverse Gaussian Model
##D sampIGmleIG <- invgaussMLE(sampIG)
##D ## draw the QQ plot on a log scale
##D qqDuration(sampIGmleIG,log="xy")
##D ## Fit it with a log normal Model
##D sampIGmleLN <- lnormMLE(sampIG)
##D ## draw the QQ plot on a log scale
##D qqDuration(sampIGmleLN,log="xy")
##D ## Fit it with a gamma Model
##D sampIGmleGA <- gammaMLE(sampIG)
##D ## draw the QQ plot on a log scale
##D qqDuration(sampIGmleGA,log="xy")
##D ## Fit it with a Weibull Model
##D sampIGmleWB <- weibullMLE(sampIG)
##D ## draw the QQ plot on a log scale
##D qqDuration(sampIGmleWB,log="xy")
##D ## Fit it with a refractory exponential Model
##D sampIGmleRE <- rexpMLE(sampIG)
##D ## draw the QQ plot on a log scale
##D qqDuration(sampIGmleRE,log="xy")
##D ## Fit it with a log logisitc Model
##D sampIGmleLL <- llogisMLE(sampIG)
##D ## draw the QQ plot on a log scale
##D qqDuration(sampIGmleLL,log="xy")
## End(Not run)



