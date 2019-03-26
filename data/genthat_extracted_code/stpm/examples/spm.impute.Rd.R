library(stpm)


### Name: spm.impute
### Title: Multiple Data Imputation with SPM
### Aliases: spm.impute

### ** Examples

## Not run: 
##D library(stpm) 
##D ##Data preparation ##
##D data <- simdata_discr(N=1000, dt = 2)
##D miss.id <- sample(x=dim(data)[1], size=round(dim(data)[1]/4)) # ~25% missing data
##D incomplete.data <- data
##D incomplete.data[miss.id,5] <- NA
##D incomplete.data[miss.id-1,6] <- NA
##D ## End of data preparation ##
##D 
##D # Estimate parameters from the complete dataset #
##D p <- spm_discrete(data, theta_range = seq(0.075, 0.09, by=0.001))
##D p
##D 
##D ##### Multiple imputation with SPM #####
##D imp.data <- spm.impute(x=incomplete.data, 
##D                       minp=5, 
##D                       theta_range=seq(0.075, 0.09, by=0.001))$imputed
##D head(imp.data)
##D ## Estimate SPM parameters from imputed data and compare them to the p ##
##D pp.test <- spm_discrete(imp.data, theta_range = seq(0.075, 0.09, by=0.001))
##D pp.test
## End(Not run)



