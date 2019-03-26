library(ILS)


### Name: plot.ils.fqcs
### Title: Plotting method for 'ils.fqcs' objects
### Aliases: plot.ils.fqcs

### ** Examples

library(ILS)
data(TG)
delta <- seq(from = 40 ,to = 850 ,length.out = 1000 )
fqcdata <- ils.fqcdata(TG, p = 7, argvals = delta)
xlab <- "Temperature/ C"
ylab <- "Mass/ %"
fqcstat <- ils.fqcs(fqcdata)
plot(fqcstat, xlab = xlab, ylab = ylab,legend = TRUE) 



