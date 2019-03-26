library(SSN)


### Name: InfoCritCompare
### Title: Compare 'glmssn' Information Criteria
### Aliases: InfoCritCompare

### ** Examples


	library(SSN)
	data(modelFits)
	#for examples only, make sure all models have the correct path
	#if you use importSSN(), path will be correct
	fitNS$ssn.object <- updatePath(fitNS$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))
	fitRE$ssn.object <- updatePath(fitRE$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))
	fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))
	fitSpRE1$ssn.object <- updatePath(fitSpRE1$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))
	fitSpRE2$ssn.object <- updatePath(fitSpRE2$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))

  compare.models <- InfoCritCompare(list(fitNS, fitRE, fitSp, fitSpRE1, fitSpRE2))
  
  # Examine the model criteria
  compare.models

  # Compare the AIC values for all models with random effects
  compare.models[c(2,4,5),c("Variance_Components","AIC")]
  
  # Compare the RMSPE for the spatial models
  compare.models[c(3,4,5),c("Variance_Components","RMSPE")]
  
  # Compare the RMSPE between spatial and non-spatial models
  compare.models[c(1,3),c("formula","Variance_Components", "RMSPE")]




