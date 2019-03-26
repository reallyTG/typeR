library(VGAM)


### Name: Rayleigh
### Title: The Rayleigh Distribution
### Aliases: Rayleigh drayleigh prayleigh qrayleigh rrayleigh
### Keywords: distribution

### ** Examples

## Not run: 
##D  Scale <- 2; x <- seq(-1, 8, by = 0.1)
##D plot(x, drayleigh(x, scale = Scale), type = "l", ylim = c(0,1),
##D      las = 1, ylab = "",
##D      main = "Rayleigh density divided into 10 equal areas; orange = cdf")
##D abline(h = 0, col = "blue", lty = 2)
##D qq <- qrayleigh(seq(0.1, 0.9, by = 0.1), scale = Scale)
##D lines(qq, drayleigh(qq, scale = Scale), col = "purple", lty = 3, type = "h")
##D lines(x, prayleigh(x, scale = Scale), col = "orange") 
## End(Not run)



