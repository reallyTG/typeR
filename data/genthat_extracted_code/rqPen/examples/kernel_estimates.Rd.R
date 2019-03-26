library(rqPen)


### Name: kernel_estimates
### Title: Kernel based estimates of Y|X
### Aliases: kernel_estimates

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- rbinom(100,1,.5)
cond_fit <- kernel_estimates(x,y,1)



