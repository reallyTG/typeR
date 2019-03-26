library(seedCCA)


### Name: Pm
### Title: Projection of a seed matrix on to the column subspace of M with
###   respect to Sx inner-product
### Aliases: Pm

### ** Examples

data(cookie)
myseq<-seq(141,651,by=2)
X<-as.matrix(cookie[-c(23,61),myseq])
Y<-as.matrix(cookie[-c(23,61),701:704])

## using cov(X,Y) as a seed matrix
seed <- cov(X,Y)
col.num <- dim(seed)[2]
M <- iniCCA(X, Y, u=4, num.d=col.num)
Sx <- cov(X)
Pm(M, Sx, seed)

## using the first 2 largest eigenvectors of cov(X,Y) as a seed matrix
seed2 <- svd(cov(X,Y))$u[,1:2]
M2 <- iniCCA(X, Y, u=4, num.d=2)
Pm(M, Sx, seed2)



