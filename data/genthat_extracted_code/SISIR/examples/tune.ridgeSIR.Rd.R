library(SISIR)


### Name: tune.ridgeSIR
### Title: Cross-Validation for ridge SIR
### Aliases: tune.ridgeSIR

### ** Examples

set.seed(1115)
tsteps <- seq(0, 1, length = 200)
nsim <- 100
simulate_bm <- function() return(c(0, cumsum(rnorm(length(tsteps)-1, sd=1))))
x <- t(replicate(nsim, simulate_bm()))
beta <- cbind(sin(tsteps*3*pi/2), sin(tsteps*5*pi/2))
y <- log(abs(x %*% beta[ ,1])) + sqrt(abs(x %*% beta[ ,2]))
y <- y + rnorm(nsim, sd = 0.1)
list_mu2 <- 10^(0:10)
listH <- c(5, 10)
list_d <- 1:4
set.seed(1129)
## Not run: 
##D res_tune <- tune.ridgeSIR(x, y, listH, list_mu2, list_d, 
##D                           nfolds = 10, parallel = TRUE)
## End(Not run)




