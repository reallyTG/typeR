library(ks)


### Name: kdcde
### Title: Deconvolution kernel density derivative estimate
### Aliases: kdcde dckde
### Keywords: smooth

### ** Examples

## No test: 
data(air)
air <- air[, c("date", "time", "co2", "pm10")]
air2 <- reshape(air, idvar="date", timevar="time", direction="wide")
air <- as.matrix(na.omit(air2[,c("co2.20:00", "pm10.20:00")]))
Sigma.air <- diag(c(var(air2[,"co2.19:00"] - air2["co2.21:00"], na.rm=TRUE),
   var(air2[,"pm10.19:00"] - air2[,"pm10.21:00"], na.rm=TRUE)))
fhat.air.dec <- kdcde(x=air, Sigma=Sigma.air, reg=0.00021, verbose=TRUE)
plot(fhat.air.dec, drawlabels=FALSE, display="filled.contour", lwd=1)
## End(No test)



