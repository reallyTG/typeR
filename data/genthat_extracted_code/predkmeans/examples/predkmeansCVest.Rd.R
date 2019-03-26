library(predkmeans)


### Name: predkmeansCVest
### Title: Cross-validation of Predictive K-means Clustering
### Aliases: predkmeansCVest predkmeansCVpred

### ** Examples

n <- 200
r1 <- rnorm(n)
r2 <- rnorm(n)
u1 <- rbinom(n, size=1,prob=0)
cluster <- ifelse(r1<0, ifelse(u1, "A", "B"), ifelse(r2<0, "C", "D"))
mu1 <- c(A=2, B=2, C=-2, D=-2)
mu2 <- c(A=1, B=-1, C=-1, D=-1)
x1 <- rnorm(n, mu1[cluster], 4)
x2 <- rnorm(n, mu2[cluster], 4)
R <- model.matrix(~r1 + r2)
X <- cbind(x1, x2)
pkmcv <- predkmeansCVest(X=cbind(x1, x2),
                         R=R, K=4, nStarts=4, cv.groups= 5,
                         TPRS=FALSE, PCA=FALSE, covarnames=colnames(R))
pkmcv



