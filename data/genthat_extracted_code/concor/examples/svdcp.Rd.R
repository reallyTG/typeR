library(concor)


### Name: svdcp
### Title: SVD for a Column Partitioned matrix x
### Aliases: svdcp

### ** Examples

x<-matrix(runif(200),10,20)
s<-svdcp(x,c(5,5,10),1)
ss<-svd(x);ss$d[1]^2
sum(s$s2)



