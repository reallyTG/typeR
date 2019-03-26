library(sads)


### Name: sads-package
### Title: Maximum Likelihood Models for Species Abundance Distributions
### Aliases: sads-package sads
### Keywords: species abundance distributions, ecology, environmetrics,
###   maximum likelihood estimation

### ** Examples

## Rank-abundance plot
plot( rad(moths) )
## Preston's plots
plot (octav(moths) )
## Fit logseries model
moths.ls <-  fitsad(moths, sad = 'ls')
## Diagnostic plots
par(mfrow=c(2,2))
plot(moths.ls)
par(mfrow = c(1,1))
## Model summary
summary(moths.ls)
## Confidence interval
confint(moths.ls)



