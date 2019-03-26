library(ILS)


### Name: ils.fqcs
### Title: It developes an object of class 'ils.fqcs'
### Aliases: ils.fqcs ils.fqcs.default ils.fqcs.ils.fqcdata print.ils.fqcs
###   summary.ils.fqcs

### ** Examples

library(ILS)
data(TG)
delta <- seq(from = 40 ,to = 850 ,length.out = 1000 )
fqcdata <- ils.fqcdata(TG, p = 7, argvals = delta)
xlab <- "Temperature/ C"
ylab <- "Mass/ %"
fqcstat <- ils.fqcs(fqcdata)
plot(fqcstat, xlab = xlab, ylab = ylab,legend = TRUE) 



