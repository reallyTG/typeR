library(prevalence)


### Name: convert-methods
### Title: Methods for Function 'as.matrix' in Package 'prevalence'
### Aliases: convert-methods as.matrix-methods as.matrix,prev-method
### Keywords: methods

### ** Examples
## Not run: 
##D 
##D ## Taenia solium cysticercosis 1-test model
##D cysti <-
##D truePrev(x = 142, n = 742,
##D          SE = ~dunif(0.60, 1.00), SP = ~dunif(0.75, 1.00))
##D 
##D head(as.matrix(cysti))
##D 
##D 
##D ## Campylobacter 2-test model
##D campy <-
##D truePrevMulti(
##D   x = c(113, 46, 156, 341),
##D   n = 656,
##D   prior = {
##D     theta[1] ~ dunif(0.45, 0.80)
##D     theta[2] ~ dunif(0.24, 0.50)
##D     theta[3] <- 1
##D     theta[4] ~ dbeta(30, 12)
##D     theta[5] ~ dbeta(1, 1)
##D     theta[6] <- 1
##D     theta[7] <- 1
##D   }
##D )
##D 
##D head(as.matrix(campy, iters = TRUE, chains = TRUE))
## End(Not run)


