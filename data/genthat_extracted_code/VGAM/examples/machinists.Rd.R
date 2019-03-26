library(VGAM)


### Name: machinists
### Title: Machinists Accidents
### Aliases: machinists
### Keywords: datasets

### ** Examples

machinists
mean(with(machinists, rep(accidents, times = ofreq)))
 var(with(machinists, rep(accidents, times = ofreq)))
## Not run: 
##D  barplot(with(machinists, ofreq),
##D           names.arg = as.character(with(machinists, accidents)),
##D           main = "Machinists accidents",
##D           col = "lightblue", las = 1,
##D           ylab = "Frequency", xlab = "accidents") 
## End(Not run)



