library(sidier)


### Name: compare.dist
### Title: Threshold to discriminate species comparing intra- and
###   interspecific distance distributions
### Aliases: compare.dist

### ** Examples


## Weak overlap
intra<-rnorm(mean=0.08,sd=0.04,n=100)
inter<-rnorm(mean=0.38,sd=0.10,n=1000)
intra[intra<0]<-0
inter[inter<0]<-0
compare.dist(distr1=intra,distr2=inter,N=50)

# Strong overlap
distr1<-rnorm(5000,mean=0.25,sd=0.070)
distr2<-rnorm(5000,mean=0.31,sd=0.075)
N<-50
compare.dist(distr1,distr2,N)




