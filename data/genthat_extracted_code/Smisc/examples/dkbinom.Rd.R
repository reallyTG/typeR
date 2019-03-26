library(Smisc)


### Name: dkbinom
### Title: Probability functions for the sum of k independent binomials
### Aliases: dkbinom pkbinom
### Keywords: misc

### ** Examples

# A sum of 3 binomials...
dkbinom(c(0, 4, 7), c(3, 4, 2), c(0.3, 0.5, 0.8))
dkbinom(c(0, 4, 7), c(3, 4, 2), c(0.3, 0.5, 0.8), method = "b")
pkbinom(c(0, 4, 7), c(3, 4, 2), c(0.3, 0.5, 0.8))
pkbinom(c(0, 4, 7), c(3, 4, 2), c(0.3, 0.5, 0.8), method = "b")

## No test: 
 
# Compare the output of the 3 methods
pkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "fft")
pkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "butler")
pkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "naive")

# Some inputs
n <- c(30000, 40000, 20000)
p <- c(0.02, 0.01, 0.005)

# Compare timings
x1 <- timeIt(pkbinom(1100, n, p, method = "butler"))
x2 <- timeIt(pkbinom(1100, n, p, method = "naive"))
x3 <- timeIt(pkbinom(1100, n, p, method = "fft"))
pvar(x1, x1 - x2, x2 - x3, x1 - x3, digits = 12)
## End(No test)



