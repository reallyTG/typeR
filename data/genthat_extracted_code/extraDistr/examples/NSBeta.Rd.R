library(extraDistr)


### Name: NSBeta
### Title: Non-standard beta distribution
### Aliases: NSBeta dnsbeta pnsbeta qnsbeta rnsbeta
### Keywords: distribution

### ** Examples


x <- rnsbeta(1e5, 5, 13, -4, 8)
hist(x, 100, freq = FALSE)
curve(dnsbeta(x, 5, 13, -4, 8), -4, 6, col = "red", add = TRUE) 
hist(pnsbeta(x, 5, 13, -4, 8))
plot(ecdf(x))
curve(pnsbeta(x, 5, 13, -4, 8), -4, 6, col = "red", lwd = 2, add = TRUE)




