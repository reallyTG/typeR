library(marqLevAlg)


### Name: print.marqLevAlg
### Title: Summary of a 'marqLevAlg' object
### Aliases: print.marqLevAlg
### Keywords: print

### ** Examples

f1 <- function(b){	
	return(4*(b[1]-5)^2+(b[2]-6)^2)	
}
test.marq <- marqLevAlg(b=c(8,9),m=2,maxiter=100,epsa=0.001,epsb=0.001,
epsd=0.001,fn=f1)

test.marq



