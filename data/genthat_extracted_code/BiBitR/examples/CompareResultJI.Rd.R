library(BiBitR)


### Name: CompareResultJI
### Title: Compare Biclustering Results using Jaccard Index
### Aliases: CompareResultJI

### ** Examples

## Not run: 
##D data <- matrix(sample(c(0,1),100*100,replace=TRUE,prob=c(0.9,0.1)),nrow=100,ncol=100)
##D data[1:10,1:10] <- 1 # BC1
##D data[11:20,11:20] <- 1 # BC2
##D data[21:30,21:30] <- 1 # BC3
##D data <- data[sample(1:nrow(data),nrow(data)),sample(1:ncol(data),ncol(data))]
##D 
##D # Result 1
##D result1 <- bibit(data,minr=5,minc=5)
##D result1
##D 
##D # Result 2
##D result2 <- bibit(data,minr=2,minc=2)
##D result2
##D 
##D ## Compare all BC's of Result 1 ##
##D Sim1 <- CompareResultJI(BCresult1=result1,type="both")
##D Sim1$SimMat
##D 
##D ## Compare BC's of Result 1 and 2 ##
##D Sim12 <- CompareResultJI(BCresult1=result1,BCresult2=result2,type="both",plot=FALSE)
##D str(Sim12)
## End(Not run)



