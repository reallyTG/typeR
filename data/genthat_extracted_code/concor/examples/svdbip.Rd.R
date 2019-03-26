library(concor)


### Name: svdbip
### Title: SVD for one bipartitioned matrix x
### Aliases: svdbip

### ** Examples

x<-matrix(runif(200),10,20)
s<-svdbip(x,c(3,4,3),c(5,15),3)
zu<-cbind(x[1:3,1:5]%*%s$v[1:5,1],x[1:3,6:20]%*%s$v[6:20,1])
czu<-svd(zu);
czu$u[,1]%*%s$u[1:3,2:3]
czu$u[,1] # is a compromise between the vectors xj*vj[,1],
# orthogonal to the partial vectors uk[,k] relative to the
# following solutions (k>1); (in a same way, the singular
# vectors ui and vj of an usual SVD of x verifies ui'*(x*vj)=0,
#when i is not equal to j)



