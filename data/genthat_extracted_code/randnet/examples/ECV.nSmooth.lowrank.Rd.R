library(randnet)


### Name: ECV.nSmooth.lowrank
### Title: selecting tuning parameter for neighborhood smoothing estimation
###   of graphon model
### Aliases: ECV.nSmooth.lowrank
### Keywords: graphon model

### ** Examples


set.seed(500)
N <- 300

U = matrix(1:N,nrow=1) / (N+1)
V = matrix(1:N,nrow=1) / (N+1)

W = (t(U))^2
W = W/3*cos(1/(W + 1e-7)) + 0.15



upper.index <- which(upper.tri(W))

A <- matrix(0,N,N)


rand.ind <- runif(length(upper.index))

edge.index <- upper.index[rand.ind < W[upper.index]]

A[edge.index] <- 1

A <- A + t(A)
diag(A) <- 0



#ecv.rank <- ECV.Rank(A,10,B=3,weighted=FALSE,mode="undirected")

#K.hat <- ecv.rank$auc.rank ## first estimate a good rank


#h.seq <- sqrt(log(N)/N)*seq(0.5,5,by=0.5)


#ecv.nsmooth <- ECV.nSmooth.lowrank(A,h.seq,K=2,B=3) ## nSmooth can be slow

#h <- h.seq[ecv.nsmooth$min.index]

#What <- nSmooth(A,h=h)

#par(mfrow=c(1,2))
#image(t(W[N:1,]))
#image(t(What[N:1,]))





