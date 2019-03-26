library(RSKC)


### Name: Clest
### Title: An implementation of Clest with robust sparse K-means.  CER is
###   used as a similarity measure.
### Aliases: Clest

### ** Examples

## Not run: 
##D # little simulation function 
##D sim <-
##D function(mu,f){
##D    D<-matrix(rnorm(60*f),60,f)
##D    D[1:20,1:50]<-D[1:20,1:50]+mu
##D    D[21:40,1:50]<-D[21:40,1:50]-mu  
##D    return(D)
##D    }
##D  
##D  set.seed(1)
##D  d<-sim(1.5,100); # non contaminated dataset with noise variables
##D  
##D # Clest with robust sparse K-means
##D rsk<-Clest(d,5,alpha=1/20,B=3,B0=10, beta = 0.05, nstart=100,pca=TRUE,L1=3,silent=TRUE);
##D # Clest with K-means
##D k<-Clest(d,5,alpha=0,B=3,B0=10, beta = 0.05, nstart=100,pca=TRUE,L1=NULL,silent=TRUE);
## End(Not run)



