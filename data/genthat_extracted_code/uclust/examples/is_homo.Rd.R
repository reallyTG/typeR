library(uclust)


### Name: is_homo
### Title: U-statistic based homogeneity test
### Aliases: is_homo

### ** Examples

x = matrix(rnorm(500000),nrow=50)  #creating homogeneous Gaussian dataset
res = is_homo(data=x)

x[1:30,] = x[1:30,]+0.15   #Heterogeneous dataset (first 30 samples have different mean)
res = is_homo(data=x)

md = as.matrix(dist(x)^2)   #squared Euclidean distances for the same data
res = is_homo(md)

# Multidimensional sacling plot of distance matrix
fit <- cmdscale(md, eig = TRUE, k = 2)
x <- fit$points[, 1]
y <- fit$points[, 2]
plot(x,y, main=paste("Homogeneity test: p-value =",res$p.MaxTest))




