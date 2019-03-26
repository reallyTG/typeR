library(languageR)


### Name: faz
### Title: Frankfurter frequencies
### Aliases: faz
### Keywords: datasets

### ** Examples

## Not run: 
##D data(faz)
##D faz$Distance = 1:nrow(faz)
##D 
##D # ---- visualization
##D 
##D plot(log(faz$Distance), log(faz$Frequency + 1), 
##D xlab = "log Distance", ylab = "log Frequency")
##D abline(v = log(49), lty=1, col="red")   # 1945
##D abline(v = log(54), lty=1, col="red")   # 1940
##D abline(v = log(76), lty=2, col="blue")  # 1918
##D abline(v = log(80), lty=2, col="blue")  # 1914
##D 
##D # ---- breakpoint analysis
##D 
##D deviances = rep(0, nrow(faz)-1)
##D faz$LogFrequency = log(faz$Frequency + 1)
##D faz$LogDistance = log(faz$Distance)
##D for (pos in 1 : (nrow(faz)-1)) {                             # be patient
##D   breakpoint = log(pos)
##D   faz$ShiftedLogDistance = faz$LogDistance - breakpoint
##D   faz$PastBreakPoint = as.factor(faz$ShiftedLogDistance > 0)
##D   faz.both = lm(LogFrequency~ShiftedLogDistance:PastBreakPoint, data = faz)
##D   deviances[pos] = deviance(faz.both)
##D }
##D breakpoint = log(which(deviances == min(deviances)))
##D 
##D # ---- refit and plot
##D 
##D faz$ShiftedLogDistance = faz$LogDistance - breakpoint
##D faz$PastBreakPoint = as.factor(faz$ShiftedLogDistance > 0)
##D faz.both = lm(LogFrequency ~ ShiftedLogDistance:PastBreakPoint, data = faz)
##D 
##D plot(faz$LogDistance, faz$LogFrequency, 
##D xlab = "log Distance", ylab = "log Frequency", col = "darkgrey")
##D lines(faz$LogDistance, fitted(faz.both))
## End(Not run)




