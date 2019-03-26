library(lori)


### Name: plot_counts
### Title: plot_counts
### Aliases: plot_counts

### ** Examples

Y <- matrix(rpois(9, lambda=1:9),nrow=3)
Y[sample(1:9, 2)] <- NA
cov <- matrix(rnorm(18), nrow=9)
colnames(cov) <- c("cov1","cov2")
res <- lori(Y,cov,1,1,rank.max=2,maxit=1)
plot_counts(res, r.cov=1:2)



