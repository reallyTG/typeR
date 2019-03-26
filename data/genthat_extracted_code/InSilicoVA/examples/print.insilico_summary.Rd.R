library(InSilicoVA)


### Name: print.insilico_summary
### Title: Print method for summarizing InSilicoVA Model Fits
### Aliases: print.insilico_summary

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
##D summary(fit1)
##D summary(fit1, top = 10)
##D 
##D # save individual COD distributions to files
##D summary(fit1, file = "results.csv")
## End(Not run)



