library(evolqg)


### Name: BootstrapR2
### Title: R2 confidence intervals by bootstrap resampling
### Aliases: BootstrapR2
### Keywords: bootstrap integration repeatability

### ** Examples

r2.dist <- BootstrapR2(iris[,1:4], 30)
quantile(r2.dist)



