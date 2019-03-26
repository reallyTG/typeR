library(marqLevAlg)


### Name: summary.marqLevAlg
### Title: summary of optimization.
### Aliases: summary.marqLevAlg
### Keywords: summary

### ** Examples

f1 <- function(b){	
	return(4*(b[1]-5)^2+(b[2]-6)^2)	
}
test.marq <- marqLevAlg(b=c(8,9),m=2,maxiter=100,epsa=0.001,epsb=0.001,
epsd=0.001,fn=f1)

summary(test.marq)



