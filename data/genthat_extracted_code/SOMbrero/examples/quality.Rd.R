library(SOMbrero)


### Name: quality
### Title: Compute SOM algorithm quality criteria
### Aliases: quality.somRes quality
### Keywords: cluster

### ** Examples

my.som <- trainSOM(x.data=iris[,1:4])
quality(my.som, quality.type="all")
quality(my.som, quality.type="topographic")



