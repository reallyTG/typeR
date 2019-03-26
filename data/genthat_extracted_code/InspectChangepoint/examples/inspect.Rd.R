library(InspectChangepoint)


### Name: inspect
### Title: Informative sparse projection for estimation of changepoints
###   (inspect)
### Aliases: inspect plot.inspect summary.inspect print.inspect
### Keywords: ~ts

### ** Examples

n <- 500; p <- 100; ks <- 30; zs <- c(125,250,375); varthetas <- c(0.1,0.15,0.2); overlap <- 0.5
obj <- multi.change(n, p, ks, zs, varthetas, overlap)
x <- obj$x
threshold <- compute.threshold(n,p)
ret <- inspect(x, threshold = threshold)
ret
summary(ret)
plot(ret)



