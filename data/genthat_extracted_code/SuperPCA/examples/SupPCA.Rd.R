library(SuperPCA)


### Name: SupPCA
### Title: Fit a supervised singular value decomposition (SupSVD) model
### Aliases: SupPCA

### ** Examples

r=2
Y <- matrix(rnorm(400,0,1),nrow=100)
B <- c(-1,1,-sqrt(3/2),-1)
B <- cbind(B,c(1,1,-1,sqrt(3/2)))
V <- matrix(rnorm(68*2),68,2)
Fmatrix <- matrix(MASS::mvrnorm(n=2*100,rep(0,2),matrix(c(9,0,0,4),2,2)),100,2)
E <- matrix(rnorm(100*68,0,3),100,68)
Yc <- scale(Y,center=TRUE,scale=FALSE)

# Case 1 (supsvd) X = YBV^T+FV^T+E
X1 <- Y%*%tcrossprod(B,V)+tcrossprod(Fmatrix,V)+E
X1c <- scale(X1,center=TRUE,scale=FALSE)
SupPCA(Yc,X1c,r)
#  Case 2 (PCA) X = FV^T+E
X2 <- tcrossprod(Fmatrix,V)+E
X2c <-scale(X2,center=TRUE,scale=FALSE)
SupPCA(Yc,X2c,r)
# Case 3 (RRR) X = YBV^T+E
X3 <- Y%*%tcrossprod(B,V)+E
X3c <- scale(X3,center=TRUE,scale=FALSE)
SupPCA(Yc,X3c,r)



