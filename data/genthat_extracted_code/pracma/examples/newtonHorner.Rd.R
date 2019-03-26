library(pracma)


### Name: newtonHorner
### Title: Newton's Root Finding Method for Polynomials.
### Aliases: newtonHorner
### Keywords: math

### ** Examples

##  Example: x^3 - 6 x^2 + 11 x - 6  with roots 1, 2, 3
p <- c(1, -6, 11, -6)
x0 <- 0
while (length(p) > 1) {
    N <- newtonHorner(p, x0)
    if (!is.null(N$root)) {
        cat("x0 =", N$root, "\n")
        p <- N$deflate
    } else {
        break
    }
}
##  Try: p <- Poly(c(1:20))



