library(ILS)


### Name: ils.fqcdata
### Title: Functional Quality Control Data
### Aliases: ils.fqcdata

### ** Examples

library(ILS)
data(TG)
delta <- seq(from = 40 ,to = 850 ,length.out = 1000 )
fqcdata <- ils.fqcdata(TG, p = 7, argvals = delta)
xlab <- "Temperature (C)"
ylab <- "Mass (%)"
main <- "TG curves obtained from calcium oxalate"
plot(x = fqcdata, main = main, xlab=xlab, ylab=xlab,col = 1:7,legend = TRUE)



