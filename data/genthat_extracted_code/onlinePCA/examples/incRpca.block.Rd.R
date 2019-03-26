library(onlinePCA)


### Name: incRpca.block
### Title: Incremental PCA with Block Update
### Aliases: incRpca.block

### ** Examples

## Simulate Brownian Motion
n <- 100 # number of sample paths
d <- 50 # number of observation points
x <- matrix(rnorm(n*d,sd=1/sqrt(d)),n,d)
x <- t(apply(x,1,cumsum)) # dim(x) = c(100,50)
q <- 10 # number of PC to compute
B <- 20 # block size
n0 <- B # initial sample size (if relevant)

## PCA without initial values
res1 <- incRpca.block(t(x), B, q=q) # data vectors in columns
res2 <- incRpca.block(x, B, q=q, byrow=TRUE) # data vectors in rows
all.equal(res1,res2) # TRUE

## PCA with initial values 
svd0 <- svd(x[1:n0,], 0, n0) # use first block for initialization 
lambda <- svd0$d[1:n0]^2/n0 # initial eigenvalues
U <- svd0$v # initial PC
res3 <- incRpca.block(x[-(1:n0),], B, lambda, U, n0, q=q, byrow=TRUE) 
# run PCA with this initialization on rest of the data 
all.equal(res1,res3) # compare with previous PCA: TRUE

## Compare with function incRpca
res4 <- list(values=lambda, vectors=U)
for (i in (n0+1):n)
	res4 <- incRpca(res4$values, res4$vectors, x[i,], i-1, q=q)
B <- 1 # vector update
res5 <- incRpca.block(x[-(1:n0),], B, lambda, U, n0, q=q, byrow=TRUE)
ind <- which(sign(res5$vectors[1,]) != sign(res4$vectors[1,]))
res5$vectors[,ind] <- - res5$vectors[,ind] # align PCs (flip orientation as needed)
all.equal(res4,res5) # TRUE



