library(detpack)


### Name: det2
### Title: Density Estimation for Bivariate Data Based on Distribution
###   Element Trees
### Aliases: det2

### ** Examples

## uniform
require(stats)
det2(rbind(runif(5e3),1+2*runif(5e3)), mode = 1, bounds = list(c(-0.1,0),c(1.1,4)))
det2(rbind(1:100,101:200+runif(100)), mode = 2) # data on a line

## Gaussian
require(stats); require(graphics); require(grDevices)
n <- 5e3; x <- rnorm(n)
x <- matrix(c(x, x+rnorm(n,0,0.5)), ncol = 2)
split.screen(c(2,2))
color = colorRamp(c("#FFFFFF","#E6E680","#E6BF1A",
                    "#E68000","#FF4026","#993380",
                    "#4D26BF","#262680","#000000"))
screen(3); plot(x, type = "p", pch = ".", main = "data")
screen(1); det2(t(x), mode = 1, main = "constant det estimator", color = color)
screen(2); det2(t(x), main = "linear det estimator", color = color)
screen(4)
det2(t(x), mode = 1, bounds = list(0,0), main = "const. det, no pre-white", color = color)



