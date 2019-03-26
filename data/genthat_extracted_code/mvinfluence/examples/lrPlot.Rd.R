library(mvinfluence)


### Name: lrPlot
### Title: Regression LR Influence Plot
### Aliases: lrPlot lrPlot.lm
### Keywords: regression

### ** Examples

# artificial example from Lawrence (1995)
x <- c( 0, 0, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 18, 18 )
y <- c( 0, 6, 6, 7, 6, 7, 6, 7, 6,  7,  6,  7,  7,  18 )
DF <- data.frame(x,y, row.names=LETTERS[1:length(x)])
DF

with(DF, {
	plot(x,y, pch=16, cex=1.3)
	abline(lm(y~x), col="red", lwd=2)
	NB <- c(1,2,13,14)
	text(x[NB],y[NB], LETTERS[NB], pos=c(4,4,2,2))
	}
)

mod <- lm(y~x, data=DF)
# standard influence plot from car
influencePlot(mod, id.n=4)

# lrPlot version
lrPlot(mod, id.n=4)


library(car)
dmod <- lm(prestige ~ income + education, data = Duncan)
influencePlot(dmod, id.n=3)
lrPlot(dmod, id.n=3)



