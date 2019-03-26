library(locfit)


### Name: crit
### Title: Compute critical values for confidence intervals.
### Aliases: crit crit<-
### Keywords: smooth

### ** Examples

# compute and plot 99% confidence intervals, with local variance estimate.
data(ethanol)
fit <- locfit(NOx~E,data=ethanol)
crit(fit) <- crit(fit,cov=0.99)
plot(fit,band="local")

# compute and plot 99% simultaneous bands
crit(fit) <- kappa0(NOx~E,data=ethanol,cov=0.99)
plot(fit,band="local")



