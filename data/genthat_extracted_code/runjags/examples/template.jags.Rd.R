library(runjags)


### Name: template.jags
### Title: Generate a generalised linear mixed model (GLMM) specification
###   in JAGS
### Aliases: template.JAGS template.jags
### Keywords: models

### ** Examples

## Not run: 
##D # Create a simple linear model and compare the results to LM:
##D 
##D # This is based on the example in ?lm:
##D ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
##D trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
##D group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
##D weight <- c(ctl, trt)
##D D9 <- data.frame(weight, group)
##D lm.D9 <- lm(weight ~ group, data=D9)
##D 
##D # The JAGS equivalent:
##D model <- template.jags(weight ~ group, D9, n.chains=2, 
##D family='gaussian')
##D JAGS.D9 <- run.jags(model)
##D summary(JAGS.D9)
##D summary(lm.D9)
##D # Note that lm reports sigma and JAGS the precision - to
##D # make them more comparable we could use a mutate function:
##D JAGS.D9 <- run.jags(model, mutate=list(prec2sd, 'precision'))
##D summary(JAGS.D9)
##D summary(lm.D9)
##D # Compare the estimated residuals:
##D plot(residuals(lm.D9), residuals(JAGS.D9, output='mean'))
##D 
##D # For more examples see:
##D vignette('quickjags', package='runjags')
## End(Not run)



