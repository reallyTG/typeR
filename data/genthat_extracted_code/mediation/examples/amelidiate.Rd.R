library(mediation)


### Name: amelidiate
### Title: Function for combining outputs from mediations function and
###   calculating quantities of interest. For use with multiple imputation
###   procedures.
### Aliases: amelidiate

### ** Examples

## Not run: 
##D # Hypothetical example
##D 
##D ## To use mediations, must make list of multiple datasets. Then, 
##D ## must also repeat the treatment assignment list as many times 
##D ## as you have data sets.
##D # datasets <- list(D1=D1, D2=D2) # list of multiply imputed data sets
##D # mediators <- c("M1")
##D # outcome <- c("Ycont1")
##D # treatment <- c("T1","T1") # note how the treatment indicator is repeated
##D # covariates <- c("X1+X2")
##D # olsols <- mediations(datasets, treatment, mediators, outcome, covariates, 
##D #                      families=c("gaussian","gaussian"), interaction=FALSE,
##D #                      conf.level=.90, sims=1000)
##D # output <- amelidiate(olsols)
##D # summary(output)
##D # plot(output)
## End(Not run)



