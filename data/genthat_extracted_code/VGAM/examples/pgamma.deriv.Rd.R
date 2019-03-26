library(VGAM)


### Name: pgamma.deriv
### Title: Derivatives of the Incomplete Gamma Integral
### Aliases: pgamma.deriv
### Keywords: math

### ** Examples

x <- seq(2, 10, length = 501)
head(ans <- pgamma.deriv(x, 2))
## Not run: 
##D  par(mfrow = c(2, 3))
##D for (jay in 1:6)
##D   plot(x, ans[, jay], type = "l", col = "blue", cex.lab = 1.5,
##D        cex.axis = 1.5, las = 1, log = "x",
##D        main = colnames(ans)[jay], xlab = "q", ylab = "") 
## End(Not run)



