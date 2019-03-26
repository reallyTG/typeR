library(denstrip)


### Name: vwstrip
### Title: Varying-width strips
### Aliases: vwstrip panel.vwstrip
### Keywords: aplot

### ** Examples

x <- seq(-4, 4, length=10000)
dens <- dnorm(x)
plot(x, xlim=c(-5, 5), ylim=c(-5, 5), xlab="x", ylab="x", type="n")
vwstrip(x, dens, at=1, ticks=qnorm(c(0.025, 0.25,0.5, 0.75, 0.975)))

## Terminate the strip at specific outer quantiles
vwstrip(x, dens, at=2, limits=qnorm(c(0.025, 0.975)))
vwstrip(x, dens, at=3, limits=qnorm(c(0.005, 0.995)))

## Compare with density strip
denstrip(x, dens, at=0)

## Estimate the density from a large sample 
x <- rnorm(10000)
vwstrip(x, at=4)
## Don't show: 
x <- seq(-4, 4, length=10000)
vwstrip(x, dens, at=-1, col="purple", lwd=2, lty=2,
ticks=qnorm(c(0.25,0.5, 0.75)), twd=3, tty=2)
vwstrip(x, dens, at=-2, border=NA)
vwstrip(x, dens, at=-4, border=NA, horiz=FALSE)
vwstrip(x, dens, at=-3, border=NA, horiz=FALSE, width=1)
vwstrip(x, dens, at=2, border=NA, horiz=FALSE, scale=2)
## End(Don't show)



