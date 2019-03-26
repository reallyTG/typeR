library(SEMModComp)


### Name: NormalTheoryLRTest
### Title: Conduct Normal Theory Likelihood Ratio Test for Mean and
###   Covariance Structure Models
### Aliases: NormalTheoryLRTest
### Keywords: htest multivariate

### ** Examples


  # Load the data and model-implied moments for the comparison of Model A 
  # to Model B in Levy and Hancock (2007)
  data(cigandalc.dat)
  data(model.A.mean.vector)
  data(model.A.cov.matrix)
  data(model.B.mean.vector)
  data(model.B.cov.matrix)

  # Conduct the normal theory LR test for the comparison of Model A 
  # to Model B in Levy and Hancock (2007)
  LR.model.A.to.model.B <- NormalTheoryLRTest(
	x = cigandalc.dat,
	model.1.mean.vector = model.A.mean.vector,
	model.1.cov.matrix = model.A.cov.matrix,
	model.2.mean.vector = model.B.mean.vector,
	model.2.cov.matrix = model.B.cov.matrix
  )



