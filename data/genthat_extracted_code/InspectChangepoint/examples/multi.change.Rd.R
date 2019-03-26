library(InspectChangepoint)


### Name: multi.change
### Title: High-dimensional time series with multiple changepoints
### Aliases: multi.change
### Keywords: ~data

### ** Examples

n <- 2000; p <- 200; ks <- 40; zs <- c(500,1000,1500); varthetas <- c(0.1,0.15,0.2); overlap <- 0.5
obj <- multi.change(n, p, ks, zs, varthetas, overlap)
plot(obj, noise = TRUE)



