library(BiBitR)


### Name: bibit_columnextension
### Title: Column Extension Procedure
### Aliases: bibit_columnextension

### ** Examples

## Not run: 
##D 
##D set.seed(1)
##D data <- matrix(sample(c(0,1),100*100,replace=TRUE,prob=c(0.9,0.1)),nrow=100,ncol=100)
##D data[1:10,1:10] <- 1 # BC1
##D data[11:20,11:20] <- 1 # BC2
##D data[21:30,21:30] <- 1 # BC3
##D data <- data[sample(1:nrow(data),nrow(data)),sample(1:ncol(data),ncol(data))]
##D 
##D result <- bibit2(data,minr=5,minc=5,noise=0.1,extend_columns = "recursive",
##D               extend_mincol=1,extend_limitcol=1)
##D result
##D result2 <- bibit_columnextension(result=out,matrix=data,arff_row_col=NULL,BC=c(1,10),
##D                               extend_columns="recursive",extend_mincol=1,
##D                               extend_limitcol=1,extend_noise=2,extend_contained=FALSE)
##D result2
## End(Not run)



