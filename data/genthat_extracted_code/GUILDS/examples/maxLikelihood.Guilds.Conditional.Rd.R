library(GUILDS)


### Name: maxLikelihood.Guilds.Conditional
### Title: Maximization of the loglikelihood under the Guilds Model,
###   conditioned on guild size.
### Aliases: maxLikelihood.Guilds.Conditional

### ** Examples

initParams <- c(20,0.1); #Initial parameters for the D0 model, c(theta,alpha)
maxLikelihood.Guilds.Conditional(initParams,model="D0", method="simplex", 
				 sadx = 1:20, sady = 1:20, verbose = TRUE)



