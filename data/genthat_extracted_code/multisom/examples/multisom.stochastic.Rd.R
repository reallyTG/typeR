library(multisom)


### Name: multisom.stochastic
### Title: Multisom for stochastic version
### Aliases: multisom.stochastic
### Keywords: MultiSOM Validity Indices Number of clusters R packages

### ** Examples

## A real data example

data<-as.matrix(iris[,-c(5)])

res<-multisom.stochastic(data, xheight = 8, xwidth = 8,"hexagonal","gaussian",
                    dist.fcts = NULL, rlen = 100,alpha = c(0.05, 0.01),
                    radius = c(2, 1.5, 1.2, 1),c("db","ratkowsky","dunn"))

res$All.index.by.layer
res$Best.nc




