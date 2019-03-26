library(mixtools)


### Name: flaremixEM
### Title: EM Algorithm for Mixtures of Regressions with Flare
### Aliases: flaremixEM
### Keywords: file

### ** Examples

## Simulation output.

set.seed(100)
j=1
while(j == 1){
    x1 <- runif(30, 0, 10)
    x2 <- runif(20, 10, 20)
    x3 <- runif(30, 20, 30)
    y1 <- 3+4*x1+rnorm(30, sd = 1)
    y2 <- 3+4*x2+rexp(20, rate = .05)
    y3 <- 3+4*x3+rnorm(30, sd = 1)
    x <- c(x1, x2, x3)
    y <- c(y1, y2, y3)
    nu <- (1:30)/2

    out <- try(flaremixEM(y, x, beta = c(3, 4), nu = nu,
               lambda = c(.75, .25), sigma = 1), silent = TRUE)
    if(class(out) == "try-error"){
        j <- 1
    } else j <- 2
}

out[4:7]
plot(x, y, pch = 19)
abline(out$beta)






