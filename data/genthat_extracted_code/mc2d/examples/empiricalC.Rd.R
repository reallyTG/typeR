library(mc2d)


### Name: empiricalC
### Title: The Continuous Empirical Distribution
### Aliases: empiricalC dempiricalC pempiricalC qempiricalC rempiricalC
### Keywords: distribution

### ** Examples

prob <- c(2, 3, 1, 6, 1)
values <- 1:5
par(mfrow=c(1, 2))
curve(dempiricalC(x, min=0, max=6, values, prob), from=-1, to=7, n=1001)
curve(pempiricalC(x, min=0, max=6, values, prob), from=-1, to=7, n=1001)

## Varying values
(values <- matrix(1:10, ncol=5))
## the first x apply to the first row 
## the second x to the second one
dempiricalC(c(1, 1), values, min=0, max=11)


##Use with mc2d 
val <- c(100, 150, 170, 200)
pr <- c(6, 12, 6, 6)
out <- c("min", "mean", "max")
##First Bootstrap in the uncertainty dimension
##with rempirical D
(x <- mcstoc(rempiricalD, type = "U", outm = out, nvariates = 30, values = val, prob = pr))
##Continuous Empirical distribution in the variability dimension
mcstoc(rempiricalC, type = "VU", values = x, min=90, max=210)






