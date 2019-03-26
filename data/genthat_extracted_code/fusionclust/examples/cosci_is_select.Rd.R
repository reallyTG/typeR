library(fusionclust)


### Name: cosci_is_select
### Title: Use a data driven approach to select the features
### Aliases: cosci_is_select

### ** Examples

## No test: 
library(fusionclust)
set.seed(42)
noise<-matrix(rnorm(49000),nrow=1000,ncol=49)
set.seed(42)
signal<-c(rnorm(500,-1.5,1),rnorm(500,1.5,1))
x<-cbind(signal,noise)
scores<- cosci_is(x,0)
features<-cosci_is_select(scores,0.9)
## End(No test)
## Don't show: 
library(fusionclust)
set.seed(42)
scores<- c(0.418,0.35,0.5*rbeta(49,0.7,6))
features<-cosci_is_select(scores,0.9)
## End(Don't show)




