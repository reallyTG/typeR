library(stepR)


### Name: sdrobnorm
### Title: Robust standard deviation estimate
### Aliases: sdrobnorm
### Keywords: nonparametric

### ** Examples

# simulate data sample
y <- rnorm(100, c(rep(1, 50), rep(10, 50)), 2)
# estimate standard deviation
sdrobnorm(y)



