library(pracma)


### Name: fnorm
### Title: Function Norm
### Aliases: fnorm
### Keywords: math

### ** Examples

xp <- seq(-1, 1, length.out = 6)
yp <- runge(xp)
p5 <- polyfit(xp, yp, 5)
f5 <- function(x) polyval(p5, x)
fnorm(runge, f5, -1, 1, p = Inf)                  #=> 0.4303246
fnorm(runge, f5, -1, 1, p = Inf, npoints = 1000)  #=> 0.4326690

# Compute mean distance using fnorm:
fnorm(runge, f5, -1, 1, p = 1, 1000) / 1000       #=> 0.1094193

# Compute mean distance by integration:
fn <- function(x) abs(runge(x) - f5(x))
integrate(fn, -1, 1)$value / 2                    #=> 0.1095285



