library(seedCCA)


### Name: covplot
### Title: scree-ploting cov(first.set, second.set)
### Aliases: covplot

### ** Examples

data(cookie)
myseq<-seq(141,651,by=2)
X<-as.matrix(cookie[-c(23,61),myseq])
Y<-as.matrix(cookie[-c(23,61),701:704])
covplot(X, Y)
covplot(X, Y, mind=4)



