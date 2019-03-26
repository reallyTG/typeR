library(denstrip)


### Name: bpstrip
### Title: Box-percentile strips
### Aliases: bpstrip panel.bpstrip
### Keywords: aplot

### ** Examples

x <- seq(-4, 4, length=1000)
prob <- pnorm(x)
plot(x, xlim=c(-5, 5), ylim=c(-5, 5), xlab="x", ylab="x", type="n")
bpstrip(x, prob, at=1, ticks=qnorm(c(0.25, 0.5, 0.75)))

## Terminate the strip at specific outer quantiles
bpstrip(x, prob, at=2, limits=qnorm(c(0.025, 0.975)))
bpstrip(x, prob, at=3, limits=qnorm(c(0.005, 0.995)))

## Compare with density strip
denstrip(x, dnorm(x), at=0)

## Estimate the density from a large sample 
x <- rnorm(10000)
bpstrip(x, at=4)
## Don't show: 
x <- seq(-4, 4, length=1000)
bpstrip(x, prob, at=-1, col="purple", lwd=2, lty=2)
bpstrip(x, prob, at=-2, border=NA, ticks=qnorm(c(0.25,0.5,0.75)),
        twd=3,tty=2)
bpstrip(x, prob, at=-4, border=NA, horiz=FALSE)
bpstrip(x, prob, at=-3, border=NA, horiz=FALSE, width=0.2)
bpstrip(x, prob, at=2, border=NA, horiz=FALSE, scale=0.5)
## End(Don't show)



