library(rqPen)


### Name: kernel_weights
### Title: Nonparametric estimate of IPW weights
### Aliases: kernel_weights

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- rbinom(100,1,.5)
wt_est <- kernel_weights(x,y)



