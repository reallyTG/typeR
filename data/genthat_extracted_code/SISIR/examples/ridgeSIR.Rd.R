library(SISIR)


### Name: ridgeSIR
### Title: ridge SIR
### Aliases: ridgeSIR

### ** Examples

set.seed(1140)
tsteps <- seq(0, 1, length = 50)
simulate_bm <- function() return(c(0, cumsum(rnorm(length(tsteps)-1, sd=1))))
x <- t(replicate(50, simulate_bm()))
beta <- cbind(sin(tsteps*3*pi/2), sin(tsteps*5*pi/2)) 
y <- log(abs(x %*% beta[ ,1])) + sqrt(abs(x %*% beta[ ,2]))
y <- y + rnorm(50, sd = 0.1)
res_ridge <- ridgeSIR(x, y, H = 10, d = 2, mu2 = 10^8)
## Not run: print(res_ridge)




