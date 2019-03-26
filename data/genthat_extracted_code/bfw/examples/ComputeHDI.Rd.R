library(bfw)


### Name: ComputeHDI
### Title: Compute HDI
### Aliases: ComputeHDI

### ** Examples

set.seed(1)
data <-rnorm(100,0,1)
credible.region <- 0.95
ComputeHDI(data,credible.region)
# HDIlo HDIhi
# -1.99 1.60



