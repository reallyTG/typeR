library(VGAM)


### Name: Polono
### Title: The Poisson Lognormal Distribution
### Aliases: Polono dpolono ppolono rpolono
### Keywords: distribution

### ** Examples

meanlog <- 0.5; sdlog <- 0.5; yy <- 0:19
sum(proby <- dpolono(yy, m = meanlog, sd = sdlog))  # Should be 1
max(abs(cumsum(proby) - ppolono(yy, m = meanlog, sd = sdlog)))  # Should be 0

## Not run: 
##D  opar = par(no.readonly = TRUE)
##D par(mfrow = c(2, 2))
##D plot(yy, proby, type = "h", col = "blue", ylab = "P[Y=y]", log = "",
##D      main = paste("Poisson lognormal(m = ", meanlog,
##D                   ", sdl = ", sdlog, ")", sep = ""))
##D 
##D y <- 0:190  # More extreme values; use the approximation and plot on a log scale
##D (sum(proby <- dpolono(y, m = meanlog, sd = sdlog, bigx = 100)))  # Should be 1
##D plot(y, proby, type = "h", col = "blue", ylab = "P[Y=y] (log)", log = "y",
##D      main = paste("Poisson lognormal(m = ", meanlog,
##D                   ", sdl = ", sdlog, ")", sep = ""))  # Note the kink at bigx
##D 
##D # Random number generation
##D table(y <- rpolono(n = 1000, m = meanlog, sd = sdlog))
##D hist(y, breaks = ((-1):max(y))+0.5, prob = TRUE, border = "blue")
##D par(opar) 
## End(Not run)



