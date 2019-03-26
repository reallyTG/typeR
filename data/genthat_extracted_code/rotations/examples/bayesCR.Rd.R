library(rotations)


### Name: bayesCR
### Title: Bayes credible regions
### Aliases: bayesCR bayesCR.Q4 bayesCR.SO3

### ** Examples

#Not run due to time constraints
## Not run: 
##D Rs <- ruars(20, rvmises, kappa = 10)
##D 
##D #Compare the region size of the moment based theory mean estimator to the
##D #Bayes region.
##D 
##D region(Rs, method = "direct", type = "theory", estimator = "mean", alp=0.1, m = 100)
##D bayesCR <- region(Rs, type = "Mises", method = "Bayes", estimator = "mean", S0 = mean(Rs),
##D                    kappa0 = 10, tuneS = 5000, tuneK = 1, burn_in = 1000, alp = .01, m = 5000)
##D 
##D bayesCR$Radius       #Region size is give by "Radius"
##D bayesCR$Shat         #The Bayes region is centered around the posterior mode: "Shat"
## End(Not run)



