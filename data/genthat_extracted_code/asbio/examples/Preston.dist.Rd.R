library(asbio)


### Name: Preston.dist
### Title: Preston diversity analysis
### Aliases: Preston.dist
### Keywords: graphs

### ** Examples


data(BCI.count)
BCI.ttl<-apply(BCI.count,2,sum)
Preston.dist(BCI.ttl)



