library(mgc)


### Name: mgc.ksample
### Title: MGC K Sample Testing
### Aliases: mgc.ksample

### ** Examples


library(mgc)

n = 100; d = 2
# simulate 200 samples which are jointly dependent in 10 dimensions
data <- mgc.sims.joint(n, d)
data_mtx <- rbind(data$X, data$Y)
labels <- c(replicate(n, 0), replicate(n, 1))
result <- mgc.ksample(data_mtx, labels, mgc.opts=list(rep=10))




