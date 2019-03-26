library(LaplacesDemon)


### Name: LossMatrix
### Title: Loss Matrix
### Aliases: LossMatrix
### Keywords: Decision Theory Utility

### ** Examples

library(LaplacesDemon)
### Point-estimated loss and state probabilities
L <- matrix(c(-500,1000,-300,-300), 2, 2)
rownames(L) <- c("s[1]: !Defaults","s[2]: Defaults")
colnames(L) <- c("a[1]: Buy ZZZ", "a[2]: Buy XXX")
L
p.theta <- matrix(c(0.9, 0.1, 1, 0), 2, 2)
Fit <- LossMatrix(L, p.theta)

### Point-estimated loss and samples of state probabilities
L <- matrix(c(-500,1000,-300,-300), 2, 2)
rownames(L) <- c("s[1]: Defaults","s[2]: !Defaults")
colnames(L) <- c("a[1]: Buy ZZZ", "a[2]: Buy XXX")
L
p.theta <- array(runif(4000), dim=c(2,2,1000)) #Random probabilities,
#just for a quick example. And, since they must sum to one:
for (i in 1:1000) {
     p.theta[,,i] <- p.theta[,,i] / matrix(colSums(p.theta[,,i]),
          dim(p.theta)[1], dim(p.theta)[2], byrow=TRUE)}
Fit <- LossMatrix(L, p.theta)
Fit

### Point-estimates of loss may be replaced with samples as well.



