library(predkmeans)


### Name: relevel.predkmeans
### Title: Re-order cluster labels
### Aliases: relevel.predkmeans

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
pkm <- predkmeans(X=cbind(x1, x2), R=R, K=4)
table(pkm$cluster)

# Move cluster '4' to be first
pkm2 <- relevel(pkm, ref=4)
table(pkm2$cluster)
# Re-order based upon number of observations in each cluster
pkm3 <- relevel(pkm, order=order(table(pkm$cluster), decreasing=TRUE))
table(pkm3$cluster)



