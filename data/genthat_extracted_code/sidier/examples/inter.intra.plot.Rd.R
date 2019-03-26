library(sidier)


### Name: inter.intra.plot
### Title: Histogram of the intra- and interspecific distances
### Aliases: inter.intra.plot

### ** Examples

# Generating a distance matrix:

my.mat<-matrix(nrow=100,ncol=100,
dimnames=list(paste("sp",rep(1:2,50),
sep=""),paste("sp",rep(1:2,50),sep="")))
L<-my.mat[seq(1,nrow(my.mat),2),seq(1,ncol(my.mat),2)]
my.mat[seq(1,nrow(my.mat),2),seq(1,ncol(my.mat),2)]<-rnorm(0.15,n=L,sd=0.01)
my.mat[seq(2,nrow(my.mat),2),seq(2,ncol(my.mat),2)]<-rnorm(0.15,n=L,sd=0.01)
my.mat[seq(1,nrow(my.mat),2),seq(2,ncol(my.mat),2)]<-rnorm(0.3,n=L,sd=0.04)
my.mat[seq(2,nrow(my.mat),2),seq(1,ncol(my.mat),2)]<-rnorm(0.3,n=L,sd=0.04)
#Converting to symmetric
my.mat<-as.matrix(as.dist(my.mat))  
inter.intra.plot(dismat=my.mat)
inter.intra.plot(dismat=my.mat,intra.n=10)
inter.intra.plot(dismat=my.mat,plot="Freq",intra.n=10)



