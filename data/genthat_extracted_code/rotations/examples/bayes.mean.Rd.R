library(rotations)


### Name: bayes.mean
### Title: Parameter estimates based on non-informative Bayes
### Aliases: bayes.mean bayes.mean.Q4 bayes.mean.SO3

### ** Examples

Rs <- ruars(20, rvmises, kappa = 10)

Shat <- mean(Rs)               #Estimate the central orientation using the projected mean
rotdist.sum(Rs, Shat, p = 2)   #The projected mean minimizes the sum of squared Euclidean
rot.dist(Shat)                 #distances, compute the minimized sum and estimator bias

#Estimate the central orientation using the posterior mode (not run due to time constraints)
#Compare it to the projected mean in terms of the squared Euclidean distance and bias
## Not run: 
##D ests <- bayes.mean(Rs, type = "Mises", S0 = mean(Rs), kappa0 = 10, tuneS = 5000,
##D                    tuneK = 1, burn_in = 1000, m = 5000)
##D 
##D Shat2 <- ests$Shat             #The posterior mode is the 'Shat' object
##D rotdist.sum(Rs, Shat2, p = 2)  #Compute sum of squared Euclidean distances
##D rot.dist(Shat2)                #Bayes estimator bias
## End(Not run)



