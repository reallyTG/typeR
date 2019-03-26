library(Smisc)


### Name: plotFun
### Title: Plot one or more functions on a single plot
### Aliases: plotFun

### ** Examples

# A single function with a single argument
f <- function(x) x^2
plotFun(f, c(-2, 3), col = "Black", lty = 2, las = 1)

# A handful of beta density functions, note how they take a single argument
fList <- list(function(x) dbeta(x, 10, 10),
              function(y) dbeta(y, 3, 3),
              function(z) dbeta(z, 0.5, 0.50))

# Plot them all on the same plot
plotFun(fList, c(0.0001, 0.9999), ylim = c(0, 3.5),
        col = c("Red", "Black", "Blue"), lty = rep(1, 3),
        xlab = "x", ylab = expression(f(x)),
        legendLabels = c("a = 10, b = 10", "a = 3, b = 3", "a = 0.5, b = 0.5"),
        relX = 0.6, relY = 1, lwd = 3, main = "Gamma Densities")



