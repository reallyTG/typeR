library(nbpMatching)


### Name: quantile,distancematrix-method
### Title: Quantile for upper-triangular values in distance matrix
### Aliases: quantile quantile,distancematrix-method

### ** Examples


plainmatrix<-as.matrix(dist(sample(1:25, 8, replace=TRUE)))
mdm<-distancematrix(plainmatrix)
quantile(mdm, probs=c(0.0, 0.25, 0.50, 0.75, 1.00))




