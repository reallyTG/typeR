library(robustbase)


### Name: psiFunc
### Title: Constructor for Objects "Psi Function" Class
### Aliases: psiFunc huberPsi hampelPsi
### Keywords: classes robust

### ** Examples

plot(huberPsi) # => shows "all" {as an object with a smart plot() method}

## classical (Gaussian / "least-squares") psi {trivial}:
F1 <- function(x, .) rep.int(1, length(x))
FF <- function(.) rep.int(1, length(.))
cPsi <- psiFunc(rho = function(x,.) x^2 / 2, psi = function(x, .) x,
                wgt = F1, Dpsi = F1,
                Erho = function(.) rep.int(1/2, length(.)),
                Epsi2 = FF, EDpsi = FF, name = "classic", . = Inf)
show(cPsi)
plot(cPsi)
## is the same as the limit of Huber's:
plot(chgDefaults(huberPsi, k = Inf))

## Hampel's psi and rho:
H.38 <- chgDefaults(hampelPsi, k = c(1.5, 3.5, 8))
k. <- H.38@xtras$tuningP$k ; k.. <- as.vector(outer(c(-1,1), k.))
c.t <- adjustcolor("skyblue3", .8)
.ax.k <- function(side) { abline(h=0, v=0, lty=2)
  axis(side, at = k.., labels=formatC(k..), pos=0, col=c.t, col.axis=c.t) }
op <- par(mfrow=c(2,1), mgp = c(1.5, .6, 0), mar = .6+c(2,2,1,.5))
curve(H.38@psi(x), -10, 10, col=2, lwd=2, n=512)
lines(k.., H.38@psi(k..), type = "h", lty=3, col=c.t); .ax.k(1)
curve(H.38@rho(x), -10, 10, col=2, lwd=2, n=512); abline(h=0, v=0, lty=2)
lines(k.., H.38@rho(k..), type = "h", lty=3, col=c.t); .ax.k(1)
title(expression("Hampel's " ~~~ psi(x) ~~ "and" ~~ rho(x) ~~~ " functions"))
par(op)

## Not the same, but similar, directly using the plot() method:
plot(H.38)



