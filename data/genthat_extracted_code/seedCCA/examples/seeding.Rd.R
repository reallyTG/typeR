library(seedCCA)


### Name: seeding
### Title: Iterative projection of a seed matrix onto cov(X)
### Aliases: seeding

### ** Examples

data(cookie)
myseq<-seq(141,651,by=2)
X<-as.matrix(cookie[-c(23,61),myseq])
Y<-as.matrix(cookie[-c(23,61),701:704])
seed <- cov(X,Y)
cov.x <- cov(X)
seeding(seed, cov.x, n=dim(X)[1], u=4)



