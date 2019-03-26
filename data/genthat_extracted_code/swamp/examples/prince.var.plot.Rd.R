library(swamp)


### Name: prince.var.plot
### Title: ScreePlot of the data variation covered by the principal
###   components
### Aliases: prince.var.plot
### Keywords: cluster

### ** Examples

## data as a matrix
set.seed(100)
g<-matrix(nrow=1000,ncol=50,rnorm(1000*50),dimnames=list(paste("Feature",1:1000),
          paste("Sample",1:50)))
g[1:100,26:50]<-g[1:100,26:50]+1 
     # the first 100 features show higher values in the samples 26:50

## to plot the variations
res2<-prince.var.plot(g,show.top=50,npermute=10)
str(res2)



