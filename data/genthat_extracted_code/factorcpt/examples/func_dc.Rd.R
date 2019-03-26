library(factorcpt)


### Name: func_dc
### Title: Double CUSUM statistics
### Aliases: func_dc

### ** Examples

e <- matrix(rnorm(100*100), nrow=100)
f <- matrix(0, nrow=100, ncol=100)
f[, 51:100] <- 1 # t = 50 represents the change-point in the means
x <- f + e
fd <- func_dc(x)
plot(fd$res, type='l'); abline(v=50, col=2) # pointwise maximum of DC statistics
image(t(fd$mat)) # heatmap of DC statistics with x-axis representing the time



