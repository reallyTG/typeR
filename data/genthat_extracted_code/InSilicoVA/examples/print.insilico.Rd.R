library(InSilicoVA)


### Name: print.insilico
### Title: Print method for summarizing InSilicoVA Model Fits
### Aliases: print.insilico

### ** Examples

## Not run: 
##D # load sample data together with sub-population list
##D data(RandomVA1)
##D # extract InterVA style input data
##D data <- RandomVA1$data
##D # extract sub-population information. 
##D # The groups are "HIV Positive", "HIV Negative" and "HIV status unknown".
##D subpop <- RandomVA1$subpop
##D 
##D # run without subpopulation
##D fit1<- insilico( data, subpop = NULL, 
##D               Nsim = 400, burnin = 200, thin = 10 , seed = 1,
##D               external.sep = TRUE, keepProbbase.level = TRUE)
##D fit1
## End(Not run)



