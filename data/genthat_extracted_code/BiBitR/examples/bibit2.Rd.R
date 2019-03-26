library(BiBitR)


### Name: bibit2
### Title: The BiBit Algorithm with Noise Allowance
### Aliases: bibit2

### ** Examples

## Not run: 
##D data <- matrix(sample(c(0,1),100*100,replace=TRUE,prob=c(0.9,0.1)),nrow=100,ncol=100)
##D data[1:10,1:10] <- 1 # BC1
##D data[11:20,11:20] <- 1 # BC2
##D data[21:30,21:30] <- 1 # BC3
##D data <- data[sample(1:nrow(data),nrow(data)),sample(1:ncol(data),ncol(data))]
##D 
##D result1 <- bibit2(data,minr=5,minc=5,noise=0.2)
##D result1
##D MaxBC(result1,top=1)
##D 
##D result2 <- bibit2(data,minr=5,minc=5,noise=3)
##D result2
##D MaxBC(result2,top=2)
## End(Not run)



