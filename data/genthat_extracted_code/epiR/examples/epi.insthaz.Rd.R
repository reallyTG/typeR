library(epiR)


### Name: epi.insthaz
### Title: Instantaneous hazard computed on the basis of a Kaplan-Meier
###   survival function
### Aliases: epi.insthaz
### Keywords: univar univar

### ** Examples

require(survival)

ov.km <- survfit(Surv(futime, fustat) ~ 1, data = ovarian)
ov.haz <- epi.insthaz(ov.km, conf.level = 0.95)
ov.shaz <- data.frame(
   time = lowess(ov.haz$time, ov.haz$lower, f = 0.50)$x,
   est =  lowess(ov.haz$time, ov.haz$est, f = 0.50)$y,
   low =  lowess(ov.haz$time, ov.haz$lower, f = 0.50)$y,
   upp =  lowess(ov.haz$time, ov.haz$upper, f = 0.50)$y)

plot(x = ov.haz$time, y = ov.haz$est, xlab = "Days", 
  ylab = "Instantaneous hazard", type = "b", pch = 16, ylim = c(0, 0.02))
lines(x = ov.shaz$time, y = ov.shaz$est, 
   lty = 1, lwd = 2, col = "red")
lines(x = ov.shaz$time, y = ov.shaz$low, 
   lty = 2, lwd = 1, col = "red")
lines(x = ov.shaz$time, y = ov.shaz$upp, 
   lty = 2, lwd = 1, col = "red")

## Not run: 
##D  
##D library(ggplot2)
##D 
##D ggplot(data = ov.haz, aes(x = time, y = est)) +
##D    geom_line() + 
##D    geom_line(data = ov.shaz, aes(x = time, y = est), 
##D       lty = 1, lwd = 1.0, col = "red") + 
##D    geom_line(data = ov.shaz, aes(x = time, y = low), 
##D       lty = 2, lwd = 0.5, col = "red") +
##D    geom_line(data = ov.shaz, aes(x = time, y = upp), 
##D       lty = 2, lwd = 0.5, col = "red") +
##D    xlab(label = "Days") +
##D    ylab("Instantaneous hazard") +
##D    ylim(0, 0.02)
## End(Not run)




