library(BTSPAS)


### Name: TimeToTargetRunSize
### Title: Computes and plots posterior distribution of time to get target
###   run size. For example, the time to reach a cumulative run of 10,000
###   fish.
### Aliases: TimeToTargetRunSize
### Keywords: ~models ~plots

### ** Examples
 
## Not run: 
##D # Compute the posterior of time to reach 10,000 fish. Results contains the MCMC object
##D # 
##D results$TimeToTargetRunSize <- TimeToTargetRunSize( 
##D         U=results$sims.list$U,
##D         time=results$data$time,
##D         targetU=10000,
##D         file_prefix = 'Time10000')
##D 
## End(Not run) 



