library(InSilicoVA)


### Name: updateIndiv
### Title: Update individual COD probabilities from InSilicoVA Model Fits
### Aliases: updateIndiv

### ** Examples

## Not run: 
##D data(RandomVA1)
##D fit1a<- insilico(RandomVA1, subpop = NULL,  
##D                 Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D                 auto.length = FALSE)
##D summary(fit1a, id = "d199")
##D 
##D # The following script updates credible interval for individual 
##D fit1b <- updateIndiv(fit1a, CI = 0.95)
##D summary(fit1b, id = "d199")
## End(Not run)



