library(abn)


### Name: ex0.dag.data
### Title: Synthetic validation data set for use with abn library examples
### Aliases: ex0.dag.data
### Keywords: datasets

### ** Examples

## Not run: 
##D ## This data set was generated using the following code:
##D  datasize<-300;
##D tmp<-c(rep("y",as.integer(datasize/2)),rep("n",as.integer(datasize/2)));
##D set.seed(1);
##D 
##D ex0.dag.data<-data.frame(b1=sample(tmp,size=datasize,replace=TRUE),
##D                 b2=sample(tmp,size=datasize,replace=TRUE),
##D                 b3=sample(tmp,size=datasize,replace=TRUE),
##D                 b4=sample(tmp,size=datasize,replace=TRUE),
##D                 b5=sample(tmp,size=datasize,replace=TRUE),
##D                 b6=sample(tmp,size=datasize,replace=TRUE),
##D                 b7=sample(tmp,size=datasize,replace=TRUE),
##D                 b8=sample(tmp,size=datasize,replace=TRUE),
##D                 b9=sample(tmp,size=datasize,replace=TRUE),
##D                 b10=sample(tmp,size=datasize,replace=TRUE),
##D                 g1=rnorm(datasize,mean=0,sd=1),
##D                 g2=rnorm(datasize,mean=0,sd=1),
##D                 g3=rnorm(datasize,mean=0,sd=1),
##D                 g4=rnorm(datasize,mean=0,sd=1),
##D                 g5=rnorm(datasize,mean=0,sd=1),
##D                 g6=rnorm(datasize,mean=0,sd=1),
##D                 g7=rnorm(datasize,mean=0,sd=1),
##D                 g8=rnorm(datasize,mean=0,sd=1),
##D                 g9=rnorm(datasize,mean=0,sd=1),
##D                 g10=rnorm(datasize,mean=0,sd=1),
##D                 p1=rpois(datasize,lambda=10),
##D                 p2=rpois(datasize,lambda=10),
##D                 p3=rpois(datasize,lambda=10),
##D                 p4=rpois(datasize,lambda=10),
##D                 p5=rpois(datasize,lambda=10),
##D                 p6=rpois(datasize,lambda=10),
##D                 p7=rpois(datasize,lambda=10),
##D                 p8=rpois(datasize,lambda=10),
##D                 p9=rpois(datasize,lambda=10),
##D                 p10=rpois(datasize,lambda=10)
##D                 );
## End(Not run)



