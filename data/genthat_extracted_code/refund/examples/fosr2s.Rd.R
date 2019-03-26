library(refund)


### Name: fosr2s
### Title: Two-step function-on-scalar regression
### Aliases: fosr2s

### ** Examples


require(fda)

# Effect of latitude on daily mean temperatures
tempmat = t(CanadianWeather$dailyAv[,,1])
latmat = cbind(1, scale(CanadianWeather$coord[ , 1], TRUE, FALSE))  # centred!
fzmod <- fosr2s(tempmat, latmat, argvals=day.5, basistype="fourier", nbasis=25)

par(mfrow=1:2)
ylabs = c("Intercept", "Latitude effect")
for (k in 1:2) {
	with(fzmod,matplot(day.5, cbind(raw.coef[,k],raw.coef[,k]-2*raw.se[,k],
	     raw.coef[,k]+2*raw.se[,k],est.func[,k],est.func[,k]-2*se.func[,k],
	     est.func[,k]+2*se.func[,k]), type=c("p","l","l","l","l","l"),pch=16,
	     lty=c(1,2,2,1,2,2),col=c(1,1,1,2,2,2), cex=.5,axes=FALSE,xlab="",ylab=ylabs[k]))
    axesIntervals()
    box()
    if (k==1) legend("topleft", legend=c("Raw","Smoothed"), col=1:2, lty=2)
}




