library(TExPosition)


### Name: tepPLS
### Title: Partial Least Squares
### Aliases: tepPLS
### Keywords: multivariate

### ** Examples

data(beer.tasting.notes)
data1<-beer.tasting.notes$data[,1:8]
data2<-beer.tasting.notes$data[,9:16]
pls.res <- tepPLS(data1,data2)



