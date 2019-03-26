library(copula)


### Name: Mvdc
### Title: Multivariate Distributions Constructed from Copulas
### Aliases: Mvdc mvdc dMvdc pMvdc rMvdc dmvdc pmvdc rmvdc
### Keywords: distribution multivariate

### ** Examples

## construct a bivariate distribution whose marginals
## are normal and exponential respectively, coupled
## together via a normal copula
mv.NE <- mvdc(normalCopula(0.75), c("norm", "exp"),
              list(list(mean = 0, sd =2), list(rate = 2)))
dim(mv.NE)
mv.NE  # using its print() / show() method

persp  (mv.NE, dMvdc, xlim = c(-4, 4), ylim=c(0, 2), main = "dMvdc(mv.NE)")
persp  (mv.NE, pMvdc, xlim = c(-4, 4), ylim=c(0, 2), main = "pMvdc(mv.NE)")
contour(mv.NE, dMvdc, xlim = c(-4, 4), ylim=c(0, 2))
## Don't show: 
set.seed(101)
## End(Don't show)
# Generate (bivariate) random numbers from that, and visualize
x.samp <- rMvdc(250, mv.NE)
plot(x.samp)
summary(fx <- dMvdc(x.samp, mv.NE))
summary(Fx <- pMvdc(x.samp, mv.NE))
op <- par(mfcol=c(1,2))
pp <- persp(mv.NE, pMvdc, xlim = c(-5,5), ylim=c(0,2),
            main = "pMvdc(mv.NE)", ticktype="detail")
px <- copula:::perspMvdc(x.samp, FUN = F.n, xlim = c(-5, 5), ylim = c(0, 2),
                         main = "F.n(x.samp)", ticktype="detail")
par(op)
all.equal(px, pp)# about 5% difference
## Don't show: 
stopifnot(all.equal(px, pp, tolerance = 0.08))
## End(Don't show)



