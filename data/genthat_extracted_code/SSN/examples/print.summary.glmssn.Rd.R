library(SSN)


### Name: print.summary.glmssn
### Title: Print summary - S3 Method for Class 'glmssn'
### Aliases: print.summary.glmssn

### ** Examples


	library(SSN)
	data(modelFits)
	#for examples only, make sure fitSp has the correct path
	#if you use importSSN(), path will be correct
	fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))
	names(fitSp)
	names(fitSp$ssn.object)

  print(summary(fitSp))
  #the same effect is achieved with this
  summary(fitSp)
  #or this
  fitSp



