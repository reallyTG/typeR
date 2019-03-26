library(polycor)


### Name: polychor
### Title: Polychoric Correlation
### Aliases: polychor
### Keywords: models

### ** Examples

if(require(mvtnorm)){
    set.seed(12345)
    data <- rmvnorm(1000, c(0, 0), matrix(c(1, .5, .5, 1), 2, 2))
    x <- data[,1]
    y <- data[,2]
    cor(x, y)  # sample correlation
    }
if(require(mvtnorm)){
    x <- cut(x, c(-Inf, .75, Inf))
    y <- cut(y, c(-Inf, -1, .5, 1.5, Inf))
    polychor(x, y)  # 2-step estimate
    }
if(require(mvtnorm)){
    set.seed(12345)
    polychor(x, y, ML=TRUE, std.err=TRUE)  # ML estimate
    }



