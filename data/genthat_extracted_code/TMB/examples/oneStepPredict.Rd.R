library(TMB)


### Name: oneStepPredict
### Title: Calculate one-step-ahead (OSA) residuals for a latent variable
###   model.
### Aliases: oneStepPredict

### ** Examples

######################## Gaussian case
runExample("simple")
osa.simple <- oneStepPredict(obj, observation.name = "x", method="fullGaussian")
qqnorm(osa.simple$residual); abline(0,1)

## Not run: 
##D ######################## Poisson case (First 100 observations)
##D runExample("ar1xar1")
##D osa.ar1xar1 <- oneStepPredict(obj, "N", "keep", method="cdf", discrete=TRUE, subset=1:100)
##D qqnorm(osa.ar1xar1$residual); abline(0,1)
## End(Not run)



