library(denstrip)


### Name: vwstrip.normal
### Title: Varying width strip for a normal or log-normal distribution
### Aliases: vwstrip.normal panel.vwstrip.normal
### Keywords: aplot

### ** Examples

x <- seq(-4, 4, length=10000)
dens <- dnorm(x)
plot(x, xlim=c(-5, 5), ylim=c(-1, 2), xlab="x", ylab="",
     type="n", axes=FALSE)
axis(1)
vwstrip(x, dens, at=0, width=0.4, limits=qnorm(c(0.005, 0.995)))
vwstrip.normal(0, 1, at=1, width=0.4, limits=qnorm(c(0.005, 0.995)))

### log-normal distribution
sdlog <- 0.5
x <- rlnorm(10000, 0, sdlog)
plot(x, xlim=c(0, 5), ylim=c(-1, 3), xlab="x", ylab="",
     type="n", axes=FALSE)
axis(1)
abline(v=1, lty=2, col="lightgray")
vwstrip(x, at=0, width=0.4, ticks=exp(-sdlog^2),
        limits=qlnorm(c(0.005,0.975),0,sdlog)) # tick at theoretical maximum density 
vwstrip(x, at=1, width=0.4, bw=0.1, ticks=exp(-sdlog^2),
        limits=qlnorm(c(0.005,0.975),0,sdlog))
vwstrip.normal(0, sdlog, log=TRUE, at=2.5, width=0.4, nx=1000,
               ticks=exp(-sdlog^2), limits=qlnorm(c(0.005,0.975),0,sdlog))



