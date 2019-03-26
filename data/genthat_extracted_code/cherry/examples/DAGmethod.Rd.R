library(cherry)


### Name: DAG Testing
### Title: Testing of hypotheses, forming a DAG.
### Aliases: DAGmethod

### ** Examples

  
  #Generate data, where the response Y is associated with two (out of 4) covariates
  set.seed(1)
  n=100
  p=4
  X <- matrix(rnorm(n*p),n,p)
  beta <- c(0,0.5,0.5,0)
  Y <- X %*% beta + rnorm(n)

  # Let us assume we have the following sets that we want to test: 
  sets <- list(c(1,2,3,4), c(1,2), c(2,3,4), c(2,3), 1, 2, 3, 4)
  names(sets) <- c(1234, 12, 234, 23, 1, 2, 3, 4)

  # Start by making the corresponding graph structure
  struct <- construct(sets)
  
  # Check whether the DAG has toway logical relations: 
  istwoway(struct)
  
  # Define the local test to be used in the closed testing procedure. 
  # This test expects a set as input. 
  mytest <- function(set)
  { 
    X <- X[,set,drop=FALSE]
    lm.out <- lm(Y ~ X)
    x <- summary(lm.out)
    return(pf(x$fstatistic[1],x$fstatistic[2],x$fstatistic[3],lower.tail=FALSE))  
  }

  # Perform the DAG procedure (default is all-parents method).
  DAG <- DAGmethod(struct, mytest, isadjusted=TRUE)
  summary(DAG)
  
  # What are the smallest sets that are found to be significant? 
  implications(DAG)
  
  # What is the adjusted p-value of the null-hypothesis corresponding to the fourth set, 
  # which is set c(2,3)? 
  # To look up the pvalue, the function uses the index or name of the set 
  # in the list of sets stored in the DAGstructure. 
  # (Note that, if there were duplicate sets in the original list, this index can be different from 
  # the one in the original list given to \code{construct})
  pvalue(DAG,4)
  pvalue(DAG, "23") #as above, but while using names
  
  # How many of the elementary hypotheses (the last 4 sets) have to be false 
  # with probability 1-alpha? 
  # Sets (don't have to be elementary hypotheses in general) must be specified 
  # by their index or name. 
  DAGpick(DAG, 5:8)
  DAGpick(DAG, c("1","2","3","4")) #as above, but while using names
  



