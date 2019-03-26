library(lqr)


### Name: dist.Truncated
### Title: Truncated Distributions
### Aliases: dtrunc extrunc ptrunc qtrunc rtrunc vartrunc
### Keywords: Distribution

### ** Examples

x <- seq(-0.5, 0.5, by = 0.1)
y <- dtrunc(x, "norm", a=-0.5, b=0.5, mean=0, sd=2)



