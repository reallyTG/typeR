library(concor)


### Name: svdbip2
### Title: SVD for bipartitioned matrix x
### Aliases: svdbip2

### ** Examples

x<-matrix(runif(200),10,20)
s2<-svdbip2(x,c(3,4,3),c(5,5,10),3);s2$s2
s1<-svdbip(x,c(3,4,3),c(5,5,10),3);s1$s2



