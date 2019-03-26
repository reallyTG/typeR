library(mixtNB)


### Name: fit.mixtNB
### Title: Fitting mixtures of Negative Binomials in RNA-Seq data
### Aliases: fit.mixtNB
### Keywords: mixture RNA-Seq data

### ** Examples

# create a toy data set with 1000 genes, and 5 samples in each of the two conditions. 
# The first 100 genes are DE expressed. The other 900 genes are null. 
 
lambda.de<-matrix(runif(100,0,250),100)
lambda.de=cbind(lambda.de,lambda.de/exp(rnorm(100,0.5,0.125)))
lambda<-rbind(lambda.de,matrix(runif(900,0,250),900,2))
a<-runif(1000,0.5,600)
cr<-rep(1:2,each=5)
y<-matrix(0,1000,10)
for (i in 1:1000) for (l in 1:10) y[i,l]<-rnbinom(1,mu=lambda[i,cr[l]],size=a[i])
fit=fit.mixtNB(y,cr,K=3)



