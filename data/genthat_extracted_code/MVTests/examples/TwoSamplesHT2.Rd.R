library(MVTests)


### Name: TwoSamplesHT2
### Title: Two Independent Samples Hotelling T^2 Test
### Aliases: TwoSamplesHT2

### ** Examples


data(iris)
G<-c(rep(1,50),rep(2,50))
# When covariances matrices are homogeneity
results1 <- TwoSamplesHT2(data=iris[1:100,1:4],group=G,alpha=0.05)
summary(results1)
# When covariances matrices are not homogeneity
results2 <- TwoSamplesHT2(data=iris[1:100,1:4],group=G,Homogenity=FALSE)
summary(results2)



