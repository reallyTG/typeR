library(wskm)


### Name: ewkm
### Title: Entropy Weighted K-Means
### Aliases: ewkm

### ** Examples


myewkm <- ewkm(iris[1:4], 3, lambda=0.5, maxiter=100)

plot(iris[1:4], col=myewkm$cluster)

# For comparative testing

mykm <- kmeans(iris[1:4], 3)

plot(iris[1:4], col=mykm$cluster)




