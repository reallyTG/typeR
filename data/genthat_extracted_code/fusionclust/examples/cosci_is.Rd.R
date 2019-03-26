library(fusionclust)


### Name: cosci_is
### Title: Rank the p features in an n by p design matrix
### Aliases: cosci_is

### ** Examples

## No test: 
library(fusionclust)
set.seed(42)
noise<-matrix(rnorm(49000),nrow=1000,ncol=49)
set.seed(42)
signal<-c(rnorm(500,-1.5,1),rnorm(500,1.5,1))
x<-cbind(signal,noise)
scores<- cosci_is(x,0)
## End(No test)
## Don't show: 
library(fusionclust)
set.seed(42)
x<-matrix(rnorm(10,0,1),5,2)
scores<- cosci_is(x,0)
## End(Don't show)




