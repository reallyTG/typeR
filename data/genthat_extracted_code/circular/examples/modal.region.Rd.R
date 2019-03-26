library(circular)


### Name: modal.region
### Title: Modal regions
### Aliases: modal.region modal.region.default modal.region.circular
### Keywords: univariate

### ** Examples

x <- rvonmises(100, circular(pi), 10)
res <- modal.region(x, bw=50)
plot(res)



