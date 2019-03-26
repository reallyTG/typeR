library(FIACH)


### Name: plot.gmm
### Title: Plot a Gaussian Mixture Model
### Aliases: plot.gmm

### ** Examples


test<-c(rnorm(1000),rnorm(1000,mean = 3,sd = 1))
hist(test)
a<-gmm(test,2)
plot(a)




