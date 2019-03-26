library(cycleRtools)


### Name: Wbal_
### Title: W' balance.
### Aliases: Wbal Wbal_

### ** Examples

## Not run: 
##D data(ridedata)
##D 
##D ## Basic usage.
##D ridedata$Wexp.kJ <- Wbal(ridedata, timer.s, power.W, 310)
##D 
##D ## Data can be noisy or "smooth"; e.g.
##D Wbal_noisy <- Wbal(ridedata, timer.s, power.W, 310, noisy = TRUE)
##D Wbal_smth  <- Wbal(ridedata, timer.s, power.W, 310, noisy = FALSE)
##D 
##D ## Plot:
##D ylim <- rev(extendrange(Wbal_noisy))  # Reverse axes.
##D 
##D plot(ridedata$timer.min, Wbal_noisy, type = "l", ylim = ylim,
##D      main = "NOISY")
##D plot(ridedata$timer.min, Wbal_smth, type = "l", ylim = ylim,
##D      main = "Smooooth")
##D 
##D ## Example of NA handling.
##D d <- data.frame(t = seq_len(20), pwr = rnorm(20, 300, 50), Wexp.J = NA)
##D d[14:16, "pwr"] <- NA
##D d[, "Wexp.J"]   <- Wbal(d, "t", "pwr", CP = 290)
##D print(d)
##D 
##D ## Using underlying Rcpp function:
##D Wbal_(t = 1:20, P = rnorm(20, 300, 50), CP = 300)  # Values are in joules.
## End(Not run)




