library(VGAM)


### Name: pgamma.deriv.unscaled
### Title: Derivatives of the Incomplete Gamma Integral (Unscaled Version)
### Aliases: pgamma.deriv.unscaled
### Keywords: math

### ** Examples

x <- 3; aa <- seq(0.3, 04, by = 0.01)
ans.u <- pgamma.deriv.unscaled(x, aa)
head(ans.u)

## Not run: 
##D  par(mfrow = c(1, 3))
##D for (jay in 1:3) {
##D   plot(aa, ans.u[, jay], type = "l", col = "blue", cex.lab = 1.5,
##D        cex.axis = 1.5, las = 1, main = colnames(ans.u)[jay],
##D        log = "", xlab = "shape", ylab = "")
##D   abline(h = 0, v = 1:2, lty = "dashed", col = "gray")  # Inaccurate at 1 and 2
##D }
## End(Not run)



