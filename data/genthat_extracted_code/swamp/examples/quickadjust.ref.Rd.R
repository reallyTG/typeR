library(swamp)


### Name: quickadjust.ref
### Title: Batch adjustment by median-scaling to a reference batch
### Aliases: quickadjust.ref
### Keywords: design

### ** Examples

## The function is currently defined as
# data as a matrix
set.seed(100)
g<-matrix(nrow=1000,ncol=50,rnorm(1000*50),dimnames=list(paste("Feature",1:1000),
          paste("Sample",1:50)))
g[1:100,26:50]<-g[1:100,26:50]+1 # the first 100 features show
# higher values in the samples 26:50
# patient annotations as a data.frame, annotations should be numbers and factors
# but not characters.
# rownames have to be the same as colnames of the data matrix 
set.seed(200)
o<-data.frame(Factor1=factor(c(rep("A",25),rep("B",25))),
              Factor2=factor(rep(c("A","B"),25)),
              Numeric1=rnorm(50),row.names=colnames(g))

##unadjusted.data
res1<-prince(g,o,top=10)
prince.plot(res1)

##batch adjustment
gadj2<-quickadjust.ref(g,o$Factor1,"B")
str(gadj2)
##prince.plot
prince.plot(prince(gadj2$adjusted.data,o,top=10)) 
    # note the high number of variation covered by the first principal component. 
    # This is caused by infalted scaling factor as the features of the 
    # input matrix g are already centered around zero.
    # this adjustment method should be used only on uncentered data.



