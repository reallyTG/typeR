library(swamp)


### Name: hca.test
### Title: Tests for annotation differences among sample clusters
### Aliases: hca.test
### Keywords: cluster htest

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

# perform the test for the main 2 clusters
res3<-hca.test(g,o,dendcut=2,test="fisher") 
        # use test="chisq" for large ncol(g) to avoid crash of R
res3$p.values



