library(multisom)


### Name: multisom.batch
### Title: MultiSOM for batch version
### Aliases: multisom.batch
### Keywords: MultiSOM Validity Indices Number of clusters R packages

### ** Examples


## A 4-dimensional example

set.seed(1)

data<-rbind(matrix(rnorm(100,sd=0.3),ncol=2),
         matrix(rnorm(100,mean=2,sd=0.3),ncol=2),
         matrix(rnorm(100,mean=4,sd=0.3),ncol=2),
         matrix(rnorm(100,mean=8,sd=0.3),ncol=2))

res<- multisom.batch(data,xheight= 8, xwidth= 8,"hexagonal",
                min.radius=0.00010,max.radius=0.002,
                maxit=1000,"random","gaussian","ch")

res$All.index.by.layer
res$Best.nc
res$Best.partition




