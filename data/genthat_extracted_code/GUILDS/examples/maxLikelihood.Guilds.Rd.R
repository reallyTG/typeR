library(GUILDS)


### Name: maxLikelihood.Guilds
### Title: Maximization of the loglikelihood under the Guilds Model.
### Aliases: maxLikelihood.Guilds

### ** Examples

initParams <- c(20,0.1); #initial parameters for the D0 model c(theta,alpha)
maxLikelihood.Guilds(initParams, model = "D0", method = "simplex", 
		     sadx = 1:20, sady = 1:20, verbose = TRUE)



