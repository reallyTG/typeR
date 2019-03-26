library(locfit)


### Name: kappa0
### Title: Critical Values for Simultaneous Confidence Bands.
### Aliases: kappa0
### Keywords: smooth

### ** Examples

# compute and plot simultaneous confidence bands
data(ethanol)
fit <- locfit(NOx~E,data=ethanol)
crit(fit) <- kappa0(NOx~E,data=ethanol)
plot(fit,crit=crit,band="local")



