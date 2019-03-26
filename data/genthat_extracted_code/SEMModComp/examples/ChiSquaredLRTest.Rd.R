library(SEMModComp)


### Name: ChiSquaredLRTest
### Title: Conduct Chi-Squared Likelihood Ratio Test for Mean and
###   Covariance Structure Models
### Aliases: ChiSquaredLRTest
### Keywords: htest multivariate

### ** Examples

  # Load the data, model-implied moments, and degrees of freedom for the
  # comparison of Model A to Model C (the BFPD-C) in Levy and Hancock (2007)
  data(cigandalc.dat)
  data(model.A.mean.vector)
  data(model.A.cov.matrix)
  data(model.A.df)
  data(model.C.mean.vector)
  data(model.C.cov.matrix)
  data(model.C.df)
  
  # Conduct the chi-squared difference LR test for the comparison of Model A 
  # to Model C (the BFPD-C) in Levy and Hancock (2007)
  LR.model.A.to.model.C  <- ChiSquaredLRTest(
	x = cigandalc.dat,
	model.1.mean.vector = model.C.mean.vector,
	model.1.cov.matrix = model.C.cov.matrix,
	model.1.df = model.C.df,
	model.2.mean.vector = model.A.mean.vector,
	model.2.cov.matrix = model.A.cov.matrix,
	model.2.df = model.A.df
  )

  # Conduct the chi-squared LR test for Model A in Levy and Hancock (2007)
  # Illustrates the use of the function to evaluate a single model 
  # (equivalently, in comparison to a saturated model)
  LR.model.A  <- ChiSquaredLRTest(
	x = cigandalc.dat,
	model.1.mean.vector = model.A.mean.vector,
	model.1.cov.matrix = model.A.cov.matrix,
	model.1.df = model.A.df
  )




