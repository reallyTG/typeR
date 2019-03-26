library(hdrcde)


### Name: cde
### Title: Conditional Density Estimation
### Aliases: cde
### Keywords: distribution hplot smooth

### ** Examples


# Old faithful data
faithful.cde <- cde(faithful$waiting, faithful$eruptions,
	x.name="Waiting time", y.name="Duration time")
plot(faithful.cde)
plot(faithful.cde, plot.fn="hdr")

# Melbourne maximum temperatures with bias adjustment
x <- maxtemp[1:3649]
y <- maxtemp[2:3650]
maxtemp.cde <- cde(x,y,
	x.name="Today's max temperature",y.name="Tomorrow's max temperature")
# Assume linear mean
fit <- lm(y~x)
fit.mean <- list(x=6:45,y=fit$coef[1]+fit$coef[2]*(6:45))
maxtemp.cde2 <- cde(x,y,mean=fit.mean,
	x.name="Today's max temperature",y.name="Tomorrow's max temperature")
plot(maxtemp.cde)




