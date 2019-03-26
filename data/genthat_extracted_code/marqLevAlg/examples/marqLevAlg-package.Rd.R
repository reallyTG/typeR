library(marqLevAlg)


### Name: marqLevAlg-package
### Title: An algorithm for least-squares curve fitting.
### Aliases: marqLevAlg-package
### Keywords: marqLevAlg algorithm optimization minimization maximisation
###   package

### ** Examples


### 1
### initial values
b <- c(8,9)
### your function
f1 <- function(b){	
	return(4*(b[1]-5)^2+(b[2]-6)^2)	
}
## Call
test1 <- marqLevAlg(b=b,fn=f1)

### 2
### initial values
b <- c(3,-1,0,1)
### your function
f2 <- function(b){	
	return((b[1]+10*b[2])^2+5*(b[3]-b[4])^2+(b[2]-2*b[3])^4+10*(b[1]-b[4])^4)	
}

## Call
test2 <- marqLevAlg(b=b,fn=f2)
test2



