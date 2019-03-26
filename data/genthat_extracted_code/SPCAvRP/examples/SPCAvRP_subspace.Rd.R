library(SPCAvRP)


### Name: SPCAvRP_subspace
### Title: Computes the leading eigenspace using the SPCAvRP algorithm for
###   eigenspace estimation
### Aliases: SPCAvRP_subspace

### ** Examples

p <- 50
k <- 8
theta <- 40
v1 <- c(rep(1/sqrt(k), k), rep(0, p-k))
theta2 <- 20
v2 <- c(rep(0,4), 1/sqrt(k), -1/sqrt(k), 1/sqrt(k), -1/sqrt(k), rep(1/sqrt(k),4), rep(0,p-12))
theta3 <- 5
v3 <- c(rep(0,6), 1/sqrt(k), -rep(1/sqrt(k),4), rep(1/sqrt(k),3), rep(0,p-14))
Sigma <- diag(p) + theta*tcrossprod(v1) + (theta2)*tcrossprod(v2) + (theta3)*tcrossprod(v3) 
mu <- rep(0, p)
n <- 2000
X <- mvrnorm(n, mu, Sigma)

loss = function(u,v){
  sqrt(abs(1-sum(v*u)^2))
}
loss_sub = function(U,V){
  V<-qr.Q(qr(V))
  norm(tcrossprod(U)-tcrossprod(V),"2")
}

s <- 2
spcarp <- SPCAvRP_subspace(data = X, cov = FALSE, s, l = rep(k,s), d = k,
                           A = 200, B = 100, center_data = FALSE)

subspace_estimation<-data.frame(
  loss(spcarp$vector[,1],v1),
  loss(spcarp$vector[,2],v2),
  loss_sub(matrix(c(v1,v2),ncol=s),spcarp$vector),
  crossprod(spcarp$vector[,1],spcarp$vector[,2]))
colnames(subspace_estimation)<-c("loss_1","loss_2","loss_sub","inp")
rownames(subspace_estimation)<-c("")
subspace_estimation



