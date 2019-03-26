library(hdrcde)


### Name: hdr.cde
### Title: Calculate highest density regions continously over some
###   conditioned variable.
### Aliases: hdr.cde
### Keywords: distribution hplot smooth

### ** Examples


faithful.cde <- cde(faithful$waiting,faithful$eruptions)
plot(faithful.cde,xlab="Waiting time",ylab="Duration time",plot.fn="hdr")




