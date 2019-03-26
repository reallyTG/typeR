library(swamp)


### Name: combat
### Title: ComBat algorithm to combine batches.
### Aliases: combat
### Keywords: design

### ** Examples

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
              Factor3=factor(c(rep("X",15),rep("Y",20),rep("Z",15))),
              Numeric1=rnorm(50),
              row.names=colnames(g))

##unadjusted.data
res1<-prince(g,o,top=10)
prince.plot(res1)

##batch adjustment for Factor 3
com1<-combat(g,o$Factor3,batchcolumn=1)
##batch adjustment for Factor 3; with covariate
com2<-combat(g,o[,c("Factor2","Factor3")],batchcolumn=2)

##prince.plot
prince.plot(prince(com1,o,top=10)) 
prince.plot(prince(com2,o,top=10)) 



