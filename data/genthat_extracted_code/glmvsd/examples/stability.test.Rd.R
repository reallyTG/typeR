library(glmvsd)


### Name: stability.test
### Title: Instability tests
### Aliases: stability.test

### ** Examples


# generate simulation data
n <- 50
p <- 8
beta<-c(2.5,1.5,0.5,rep(0,5))
sigma<-matrix(0,p,p)
for(i in 1:p){
   for(j in 1:p) sigma[i,j] <- 0.5^abs(i-j)
}
x <- mvrnorm(n, rep(0,p), sigma)
e <- rnorm(n)
y <- x %*% beta + e

ins_seq <- stability.test(x, y, method = "seq", 
penalty = "SCAD", nrep = 20, 
remove = 0.1, tau = 0.2, nfolds = 5)



