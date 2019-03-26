library(uclust)


### Name: uclust
### Title: U-statistic based significance clustering
### Aliases: uclust

### ** Examples

set.seed(17161)
x = matrix(rnorm(100000),nrow=50)  #creating homogeneous Gaussian dataset
res = uclust(data=x)

x[1:30,] = x[1:30,]+0.25   #Heterogeneous dataset (first 30 samples have different mean)
res = uclust(data=x)

md = as.matrix(dist(x)^2)   #squared Euclidean distances for the same data
res = uclust(md)

# Multidimensional scaling plot of distance matrix
fit <- cmdscale(md, eig = TRUE, k = 2)
x <- fit$points[, 1]
y <- fit$points[, 2]
col=rep(3,dim(md)[1])
col[res$cluster2]=2
plot(x,y, main=paste("Multidimensional scaling plot of data:
                    homogeneity p-value =",res$ishomoResult$p.MaxTest),col=col)





