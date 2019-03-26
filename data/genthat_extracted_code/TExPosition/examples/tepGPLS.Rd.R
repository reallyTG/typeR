library(TExPosition)


### Name: tepGPLS
### Title: Generalized Partial Least Squares
### Aliases: tepGPLS
### Keywords: multivariate

### ** Examples

data(beer.tasting.notes)
data1<-beer.tasting.notes$data[,1:8]
data2<-beer.tasting.notes$data[,9:16]
gpls.res <- tepGPLS(data1,data2)



