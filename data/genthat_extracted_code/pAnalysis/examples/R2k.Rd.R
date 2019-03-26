library(pAnalysis)


### Name: R2k
### Title: Conversion of standard R2 to a noise/dof-independent value
### Aliases: R2k
### Keywords: Equivalent R2

### ** Examples

	r2a <- 0.839
	dof <- 10
	r2ka <- R2k(r2a, dof)
	r2b <- runif(n=20,min=0.71,max=0.73)
	r2kb <- R2k(r2b, dof)



