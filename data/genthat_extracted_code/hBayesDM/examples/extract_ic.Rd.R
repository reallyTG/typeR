library(hBayesDM)


### Name: extract_ic
### Title: Extract Model Comparison Estimates
### Aliases: extract_ic

### ** Examples

## Not run: 
##D library(hBayesDM)
##D output = bandit2arm_delta("example", niter = 2000, nwarmup = 1000, nchain = 4, ncore = 1)
##D # To show the LOOIC model fit estimates (a detailed report; c)
##D extract_ic(output)
##D # To show the WAIC model fit estimates
##D extract_ic(output, ic = "waic")
## End(Not run)




