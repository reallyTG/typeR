library(abn)


### Name: ex1.dag.data
### Title: Synthetic validation data set for use with abn library examples
### Aliases: ex1.dag.data
### Keywords: datasets

### ** Examples

## Not run: 
##D ## the true underlying stochastic model has DAG - this data is one realisation from this.
##D ex1.true.dag<-matrix(data=c(
##D   0,0,0,0,0,0,0,0,0,0,
##D   0,0,0,0,0,0,0,0,0,0,
##D   0,0,0,0,0,0,0,0,0,0,
##D   0,0,0,0,0,0,0,0,0,0,
##D   1,1,0,0,0,0,0,0,0,0,
##D   1,0,1,1,0,0,0,0,0,0,
##D   0,1,1,1,0,0,0,0,0,0,
##D   0,0,1,0,1,0,0,0,0,0,
##D   0,0,1,0,0,0,1,0,0,0,
##D   0,0,1,1,0,0,0,0,0,0
##D    ), ncol=10,byrow=TRUE);
##D 
##D colnames(ex1.true.dag)<-rownames(ex1.true.dag)<-c("b1","p1","g1","b2","p2","b3","g2","b4",
##D "b5","g3");
##D 
## End(Not run)



