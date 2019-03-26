library(BCSub)


### Name: BCSub
### Title: A Bayesian semiparametric factor analysis model for subtype
###   identification (Clustering).
### Aliases: BCSub

### ** Examples

set.seed(1)
n = 100 ## number of subjects
G = 200 ## number of genes
SNR = 0 ## ratio of noise genes
## loading matrix with four factors
lam = matrix(0,G,4)
lam[1:(G/4),1] = runif(G/4,-3,3)
lam[(G/4+1):(G/2),2] = runif(G/4,-3,3)
lam[(G/2+1):(3*G/4),3] = runif(G/4,-3,3)
lam[(3*G/4+1):(G),4] = runif(G/4,-3,3)
## generate low-rank covariance matrix
sigma <- lam%*%t(lam) + diag(rep(1,G))
sigma <- cov2cor(sigma)
## true cluster structure ##
e.true = c(rep(1,n/2),rep(2,n/2))

## generate data matrix ##
mu1 = rep(1,G)
mu1[sample(1:G,SNR*G)] = 0
mu2 <- rep(0,G)
A = rbind(mvrnorm(n/2,mu1,sigma),mvrnorm(n/2,mu2,sigma))

## factor analysis to decide the number of factors
## Not run: 
##D ev = eigen(cor(A))
##D ap = parallel(subject=nrow(A),var=ncol(A),rep=100,cent=.05)
##D nS = nScree(x=ev$values, aparallel=ap$eigen$qevpea)
##D M = nS$Components[1,3] ## number of factors
## End(Not run)
M = 4
## run BCSub for clustering
iters = 1000 ## total number of iterations
seq = 600:1000 ## posterior samples used for inference
system.time(res <- BCSub(A,iter=iters,seq=seq,M=M))
res$CL ## inferred cluster structure

## calculate and plot similarity matrix
sim = calSim(t(res$E[,seq]))

## plot similarity matrix
x <- rep(1:n,times=n)
y <- rep(1:n,each=n)
z <- as.vector(sim)
levelplot(z~x*y,col.regions=rev(gray.colors(n^2)), xlab = "Subject ID",ylab = "Subject ID")



