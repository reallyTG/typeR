library(concor)


### Name: svdbips
### Title: SVD for bipartitioned matrix x
### Aliases: svdbips

### ** Examples

x<-matrix(runif(200),10,20)
s1<-svdbip(x,c(3,4,3),c(5,5,10),2);sum(sum(sum(s1$s2)))
ss<-svdbips(x,c(3,4,3),c(5,5,10),2);sum(sum(sum(ss$s2)))



