library(polycor)


### Name: polyserial
### Title: Polyserial Correlation
### Aliases: polyserial
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
    y <- cut(y, c(-Inf, -1, .5, 1.5, Inf))
    polyserial(x, y)  # 2-step estimate
    }
if(require(mvtnorm)){
    polyserial(x, y, ML=TRUE, std.err=TRUE) # ML estimate
    }



