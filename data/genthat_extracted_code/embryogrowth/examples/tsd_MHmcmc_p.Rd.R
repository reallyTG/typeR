library(embryogrowth)


### Name: tsd_MHmcmc_p
### Title: Generates set of parameters to be used with tsd_MHmcmc()
### Aliases: tsd_MHmcmc_p

### ** Examples

## Not run: 
##D library(embryogrowth)
##D eo <- subset(Database_TSD, Species=="Emys orbicularis", c("Males", "Females", 
##D                                        "Incubation.temperature"))
##D eo_logistic <- with(eo, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature))
##D pMCMC <- tsd_MHmcmc_p(eo_logistic, accept=TRUE)
## End(Not run)



