library(stabledist)


### Name: StableDistribution
### Title: Stable Distribution Function
### Aliases: StableDistribution dstable pstable qstable rstable
### Keywords: distribution

### ** Examples

## stable -

## Plot stable random number series
   set.seed(1953)
   r <- rstable(n = 1000, alpha = 1.9, beta = 0.3)
   plot(r, type = "l", main = "stable: alpha=1.9 beta=0.3",
        col = "steelblue")
   grid()

## Plot empirical density and compare with true density:
   hist(r, n = 25, probability = TRUE, border = "white",
        col = "steelblue")
   x <- seq(-5, 5, 0.25)
   lines(x, dstable(x, alpha = 1.9, beta = 0.3, tol= 1e-3), lwd = 2)

## Plot df and compare with true df:
   plot(ecdf(r), do.points=TRUE, col = "steelblue",
        main = "Probabilities:  ecdf(rstable(1000,..)) and true  cdf F()")
   rug(r)
   lines(x, pstable(q = x, alpha = 1.9, beta = 0.3),
         col="#0000FF88", lwd= 2.5)

## Switching  sign(beta)  <==> Mirror the distribution around  x == delta:
curve(dstable(x, alpha=1.2, beta =  .8, gamma = 3, delta = 2), -10, 10)
curve(dstable(x, alpha=1.2, beta = -.8, gamma = 3, delta = 2),
      add=TRUE, col=2)
## or the same
curve(dstable(2*2-x, alpha=1.2, beta = +.8, gamma = 3, delta = 2),
      add=TRUE, col=adjustcolor("gray",0.2), lwd=5)
abline(v = 2, col = "gray", lty=2, lwd=2)
axis(1, at = 2, label = expression(delta == 2))

## Compute quantiles:
   x. <- -4:4
   px <- pstable(x., alpha = 1.9, beta = 0.3)
  (qs <- qstable(px, alpha = 1.9, beta = 0.3))
   stopifnot(all.equal(as.vector(qs), x., tol = 1e-5))



