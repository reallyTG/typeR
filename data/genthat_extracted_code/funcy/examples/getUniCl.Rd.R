library(funcy)


### Name: getUniCl
### Title: Unique cluster labels
### Aliases: getUniCl

### ** Examples

##Generate dataset
nr_time <- sample(1:5, 100,  replace=TRUE)
clusters <- sample(1:4, 100, replace=TRUE)
IDs <- rep(1:100, nr_time)
cls <- rep(clusters,nr_time)
IDs
cls

##Get reduced cluster vector according to IDs
unicl <- getUniCl(IDs,cls)
unicl

##Get original cluster vector from reduced one
dupcl <- getUniCl(IDs,unicl, reduce=FALSE)
dupcl



