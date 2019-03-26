library(swamp)


### Name: feature.assoc
### Title: Associations of the features to a sample annotation in observed
###   and reshuffled data.
### Aliases: feature.assoc
### Keywords: htest

### ** Examples

## data as a matrix
set.seed(100)
g<-matrix(nrow=1000,ncol=50,rnorm(1000*50),dimnames=list(paste("Feature",1:1000),
   paste("Sample",1:50)))
g[1:100,26:50]<-g[1:100,26:50]+1 # the first 100 features show
# higher values in the samples 26:50
## patient annotations as a data.frame, annotations should be numbers and factor
# but not characters.
## rownames have to be the same as colnames of the data matrix 
set.seed(200)
o<-data.frame(Factor1=factor(c(rep("A",25),rep("B",25))),
              Factor2=factor(rep(c("A","B"),25)),
              Numeric1=rnorm(50),row.names=colnames(g))

# calculate the associations to Factor 1
res4a<-feature.assoc(g,o$Factor1,method="correlation")
res4b<-feature.assoc(g,o$Factor1,method="t.test",g1=res4a$permuted.data) 
    # uses t.test instead, reuses the permuted data generated in res4a
res4c<-feature.assoc(g,o$Factor1,method="AUC",g1=res4a$permuted.data) 
    # uses AUC instead, reuses the permuted data generated in res4a
str(res4a)
 



