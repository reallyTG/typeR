library(NormExpression)


### Name: getArea
### Title: getArea
### Aliases: getArea
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, y)
{
    x <- x/max(x)
    y <- y/max(y)
    if (!(is.numeric(x) || is.complex(x)) || !(is.numeric(y) ||
        is.complex(y))) {
        stop("Arguments 'x' and 'y' must be real or complex vectors.")
    }
    if (length(x) != length(y)) {
        stop("The length of two input vectors should be equal!")
    }
    m <- length(x)
    n <- 2 * m
    xp <- c(x, x[m:1])
    yp <- c(numeric(m), y[m:1])
    p1 <- sum(xp[1:(n - 1)] * yp[2:n]) + xp[n] * yp[1]
    p2 <- sum(xp[2:n] * yp[1:(n - 1)]) + xp[1] * yp[n]
    return(0.5 * (p1 - p2))
  }



