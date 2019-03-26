library(cmna)


### Name: gradient
### Title: Gradient descent
### Aliases: gradient graddsc gradasc gd

### ** Examples

fp <- function(x) { x^3 + 3 * x^2 - 1 }
graddsc(fp, 0)

f <- function(x) { (x[1] - 1)^2 + (x[2] - 1)^2 }
fp <-function(x) {
    x1 <- 2 * x[1] - 2
    x2 <- 8 * x[2] - 8

    return(c(x1, x2))
}
gd(fp, c(0, 0), 0.05)



