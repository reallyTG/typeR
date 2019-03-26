library(datafsm)


### Name: evolve_model
### Title: Use a Genetic Algorithm to Estimate a Finite-state Machine Model
### Aliases: evolve_model

### ** Examples

## Not run: 
##D # Create data:
##D cdata <- data.frame(period = rep(1:10, 1000),
##D                    outcome = rep(1:2, 5000),
##D                    my.decision1 = sample(1:0, 10000, TRUE),
##D                    other.decision1 = sample(1:0, 10000, TRUE))
##D (res <- evolve_model(cdata, cv=FALSE))
##D summary(res)
##D plot(res, action_label = c("C", "D"))
##D library(GA)
##D plot(estimation_details(res))
## End(Not run)

# In scripts, it can makes sense to set parallel to
# 'as.logical(Sys.info()['sysname'] != 'Windows')'.




