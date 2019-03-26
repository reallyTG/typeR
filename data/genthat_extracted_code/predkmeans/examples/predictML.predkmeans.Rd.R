library(predkmeans)


### Name: predictML.predkmeans
### Title: Prediction of Cluster Membership
### Aliases: predictML.predkmeans predictML predictSVM.predkmeans
###   predictSVM predictMixExp.predkmeans predictMixExp

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
R <- cbind(1, r1, r2)
X <- cbind(x1, x2)
pkm <- predkmeans(X=cbind(x1, x2), R=R, K=4)
n_pred <- 50
Rnew <- cbind(1, r1=rnorm(n_pred), r2=rnorm(n_pred))
pkmPred <- predictML(pkm, R=Rnew, Rstar=R)
pkmPred$test.pred 



