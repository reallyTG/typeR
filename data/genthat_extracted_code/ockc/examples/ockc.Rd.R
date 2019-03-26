library(ockc)


### Name: ockc
### Title: Order Contrained Solutions in k-Means Clustering
### Aliases: ockc ockc-class show,ockc-method
### Keywords: cluster

### ** Examples

x <- rbind(cbind(rnorm(10, mean=0), rnorm(10, mean=0,), rnorm(10, mean=0)),
           cbind(rnorm(10, mean=10), rnorm(10, mean=10), rnorm(10, mean=0)),
           cbind(rnorm(10, mean=10), rnorm(10, mean=0), rnorm(10, mean=10)),
           cbind(rnorm(10, mean=10), rnorm(10, mean=10), rnorm(10, mean=10))
           )

res <- ockc(x, k=4, nboot=4, order=c(1:10, 21:40, 11:20))
res



