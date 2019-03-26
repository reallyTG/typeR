library(copula)


### Name: evCopula
### Title: Construction of Extreme-Value Copula Objects
### Aliases: evCopula galambosCopula huslerReissCopula tawnCopula tevCopula
### Keywords: distribution multivariate

### ** Examples

## Gumbel is both
stopifnot(identical(   evCopula("gumbel"), gumbelCopula()),
          identical(archmCopula("gumbel"), gumbelCopula()))

## For a given degree of dependence these copulas are strikingly similar :

tau <- 1/3

gumbel.cop      <- gumbelCopula     (iTau(gumbelCopula(),      tau))
galambos.cop    <- galambosCopula   (iTau(galambosCopula(),    tau))
huslerReiss.cop <- huslerReissCopula(iTau(huslerReissCopula(), tau))
tawn.cop        <- tawnCopula       (iTau(tawnCopula(),        tau))
tev.cop         <- tevCopula        (iTau(tevCopula(),         tau))

curve(A(gumbel.cop, x), 0, 1, ylab = "A(<cop>( iTau(<cop>(), tau)), x)",
      main = paste("A(x) for five Extreme Value cop. w/  tau =", format(tau)))
curve(A(galambos.cop, x), lty=2, add=TRUE)
curve(A(huslerReiss.cop, x), lty=3, add=TRUE)
curve(A(tawn.cop, x), lty=4, add=TRUE)
curve(A(tev.cop, x), lty=5, col=2, add=TRUE)# very close to Gumbel

## And look at the differences
curve(A(gumbel.cop, x) - A(tawn.cop, x), ylim = c(-1,1)*0.005,
      ylab = '', main = "A(<Gumbel>, x) - A(<EV-Cop.>, x)")
abline(h=0, lty=2)
curve(A(gumbel.cop, x) - A(galambos.cop, x), add=TRUE, col=2)
curve(A(gumbel.cop, x) - A(huslerReiss.cop, x), add=TRUE, col=3)
curve(A(gumbel.cop, x) - A(tev.cop, x), add=TRUE, col=4, lwd=2)


## the t-EV-copula has always positive tau :
curve(vapply(x, function(x) tau(tevCopula(x)), 0.), -1, 1,
      n=257, ylim=0:1, xlab=quote(rho),ylab=quote(tau),
      main= quote(tau( tevCopula(rho) )), col = 2, lwd = 2)
rect(-1,0,1,1, lty = 2, border = adjustcolor("black", 0.5))



