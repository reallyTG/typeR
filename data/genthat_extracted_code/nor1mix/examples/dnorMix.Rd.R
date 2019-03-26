library(nor1mix)


### Name: dnorMix
### Title: Normal Mixture Density
### Aliases: dnorMix dnorMixL dpnorMix
### Keywords: distribution

### ** Examples

 ff <- dnorMixL(MW.nm7)
 str(ff)
 plot(ff, type = "h", ylim = c(0,1)) # rather use plot(ff, ...)

 x <- seq(-4,5, length=501)
 dp <- dpnorMix(x, MW.nm7)
 lines(x, dp$d, col = "tomato", lwd=3)
 lines(x, dp$p, col = 3, lwd=2)# does not fit y-wise
 stopifnot(all.equal(dp$d, dnorMix(x, MW.nm7), tolerance=1e-12),
           all.equal(dp$p, pnorMix(x, MW.nm7), tolerance=1e-12))



