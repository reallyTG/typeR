library(heplots)


### Name: ReactTime
### Title: Reaction Time Data
### Aliases: ReactTime
### Keywords: datasets

### ** Examples

data(ReactTime)
(RT.mod <- lm(as.matrix(ReactTime)~1))

# within-S factors
within <- expand.grid(tilt=ordered(c(0,4,8)), noise=c("NA", "NP"))
Anova(RT.mod, idata=within, idesign=~tilt * noise)

heplot(RT.mod, idata=within, idesign=~tilt * noise, iterm="tilt")

# plotting means and std errors directly

levels <- expand.grid(Tilt=c(0,4,8), noise=c("NA", "NP"))
(means.df <- data.frame(levels, mean=colMeans(ReactTime), se=sqrt(diag(var(ReactTime)))/9))

with(means.df, {
	plot(Tilt, mean, type="n", main="Reaction Time data", xlab="Tilt", ylab="Reaction time")
	colors <- rep(c("red", "blue"), each=3)
	pts <- rep(c(15, 16), each=3)

	lines(Tilt[1:3], mean[1:3], col="red", lwd=2)
	lines(Tilt[4:6], mean[4:6], col="blue", lwd=2)
	points(Tilt, mean, pch=pts, col=colors, cex=1.2)
	arrows(Tilt, mean-se, Tilt, mean+se, angle=90, code=3, 
			col=colors, len=.05, lwd=2)
	# labels at last point, in lieu of legend
	text(Tilt[3], mean[3]-10, labels="NA", col="red", pos=1)
	text(Tilt[6], mean[6]-10, labels="NP", col="blue", pos=1)
	}
	)



