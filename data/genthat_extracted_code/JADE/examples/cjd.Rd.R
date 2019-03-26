library(JADE)


### Name: cjd
### Title: Joint Diagonalization of Complex Matrices
### Aliases: cjd
### Keywords: array

### ** Examples

D1 <- diag(complex(real=runif(3,0,2), imaginary=runif(3)))
D2 <- diag(complex(real=runif(3,0,2), imaginary=runif(3)))
D3 <- diag(complex(real=runif(3,0,2), imaginary=runif(3)))
D4 <- diag(complex(real=runif(3,0,2), imaginary=runif(3)))

Z <- matrix(runif(9), ncol = 3)
V <- eigen(Z %*% t(Z))$vectors

M1 <- t(V)%*%D1%*%V
M2 <- t(V)%*%D2%*%V
M3 <- t(V)%*%D3%*%V
M4 <- t(V)%*%D4%*%V
MS <- rbind(M1,M2,M3,M4)
Ms <- array(0,dim=c(3,3,4))
Ms[,,1]<-M1
Ms[,,3]<-M3
Ms[,,2]<-M2
Ms[,,4]<-M4
res.array <- cjd(Ms)
res.mat <- cjd(MS)
Re(res.array$V)
V
round(V%*%Re(res.array$V),2)
round(V%*%Re(res.mat$V),2)



