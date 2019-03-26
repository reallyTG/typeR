library(qrnn)


### Name: quantile.dtn
### Title: Interpolated quantile distribution with exponential tails
### Aliases: dquantile pquantile qquantile rquantile

### ** Examples

## Normal distribution
tau <- seq(0.05, 0.95, by=0.05)
quant <- qnorm(tau)

x <- seq(-3, 3, length=500)
plot(x, dnorm(x), type="l", col="red", lty=2, lwd=2,
     main="pdf")
lines(x, dquantile(x, tau, quant), col="blue")

q <- seq(-3, 3, length=20)
plot(q, pnorm(q), type="b", col="red", lty=2, lwd=2,
     main="cdf")
lines(q, pquantile(q, tau, quant),
      col="blue")

p <- c(0.001, 0.01, 0.025, seq(0.05, 0.95, by=0.05),
       0.975, 0.99, 0.999)
plot(p, qnorm(p), type="b", col="red", lty=2, lwd=2,
     main="inverse cdf")
lines(p, qquantile(p, tau, quant), col="blue")

## Distribution with point mass at zero
tau.0 <- c(0.3, 0.5, 0.7, 0.8, 0.9)
quant.0 <- c(0, 5, 7, 15, 20)

r.0 <- rquantile(500, tau=tau.0, quant=quant.0, lower=0)
x.0 <- seq(0, 40, by=0.5)
d.0 <- dquantile(x.0, tau=tau.0, quant=quant.0, lower=0)
p.0 <- pquantile(x.0, tau=tau.0, quant=quant.0, lower=0)
q.0 <- qquantile(p.0, tau=tau.0, quant=quant.0, lower=0)

par(mfrow=c(2, 2))
plot(r.0, pch=20, main="random")
plot(x.0, d.0, type="b", col="red", main="pdf")
plot(x.0, p.0, type="b", col="blue", ylim=c(0, 1),
     main="cdf")
plot(p.0, q.0, type="b", col="green", xlim=c(0, 1),
     main="inverse cdf")



