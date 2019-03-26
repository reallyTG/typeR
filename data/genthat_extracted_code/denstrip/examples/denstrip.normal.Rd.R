library(denstrip)


### Name: denstrip.normal
### Title: Density strip for a normal or log-normal distribution
### Aliases: denstrip.normal panel.denstrip.normal
### Keywords: aplot

### ** Examples

x <- seq(-4, 4, length=10000)
dens <- dnorm(x)
plot(x, xlim=c(-5, 5), ylim=c(-1, 2), xlab="x", ylab="", type="n", axes=FALSE)
axis(1)
denstrip(x, dens, at=0, width=0.3)
denstrip.normal(0, 1, at=1, width=0.3)

### log-normal distribution
sdlog <- 0.5
x <- rlnorm(10000, 0, sdlog)
plot(x, xlim=c(0, 5), ylim=c(-2, 4), xlab="x", , ylab="", type="n",
     axes=FALSE)
axis(1)
abline(v=1, lty=2, col="lightgray")
denstrip(x, at=0, ticks=exp(-sdlog^2), width=0.4) # tick at theoretical maximum density 
denstrip(x, at=1, bw=0.1, ticks=exp(-sdlog^2), width=0.4)
denstrip.normal(0, sdlog, log=TRUE, at=3, nx=1000,
                ticks=exp(-sdlog^2), width=0.4)



