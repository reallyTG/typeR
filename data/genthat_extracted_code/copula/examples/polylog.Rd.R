library(copula)


### Name: polylog
### Title: Polylogarithm Li_s(z) and Debye Functions
### Aliases: polylog debye1 debye2
### Keywords: arith

### ** Examples

## The dilogarithm,  polylog(z, s = 2) = Li_2(.) -- mathmatically defined on C \ [1, Inf)
## so x -> 1 is a limit case:
polylog(z = 1, s = 2)
## in the limit, should be equal to
pi^2 / 6

## Default method uses  GSL's dilog():
rLi2 <- curve(polylog(x, 2), -5, 1, n= 1+ 6*64, col=2, lwd=2)
abline(c(0,1), h=0,v=0:1, lty=3, col="gray40")
## "sum" method gives the same for |z| < 1 and large number of terms:
ii <- which(abs(rLi2$x) < 1)
stopifnot(all.equal(rLi2$y[ii],
            polylog(rLi2$x[ii], 2, "sum", n.sum = 1e5),
          tolerance = 1e-15))


z1 <- c(0.95, 0.99, 0.995, 0.999, 0.9999)
L   <- polylog(         z1,  s=-3,method="negI-s-Euler") # close to Inf
LL  <- polylog(     log(z1), s=-3,method="negI-s-Euler",is.log.z=TRUE)
LLL <- polylog(log(-log(z1)),s=-3,method="negI-s-Euler",is.logmlog=TRUE)
all.equal(L, LL)
all.equal(L, LLL)

p.Li <- function(s.set, from = -2.6, to = 1/4, ylim = c(-1, 0.5),
                 colors = c("orange","brown", palette()), n = 201, ...)
{
    s.set <- sort(s.set, decreasing = TRUE)
    s <- s.set[1] # <_ for auto-ylab
    curve(polylog(x, s, method="negI-s-Stirling"), from, to,
          col=colors[1], ylim=ylim, n=n, ...)
    abline(h=0,v=0, col="gray")
    for(is in seq_along(s.set)[-1])
        curve(polylog(x, s=s.set[is], method="negI-s-Stirling"),
              add=TRUE, col = colors[is], n=n)
    s <- rev(s.set)
    legend("bottomright",paste("s =",s), col=colors[2-s], lty=1, bty="n")
}

## yellow is unbearable (on white):
palette(local({p <- palette(); p[p=="yellow"] <- "goldenrod"; p}))

## Wikipedia page plot (+/-):
p.Li(1:-3, ylim= c(-.8, 0.6), colors = c(2:4,6:7))

## and a bit more:
p.Li(1:-5)

## For the range we need it:
ccol <- c(NA,NA, rep(palette(),10))
p.Li(-1:-20, from=0, to=.99, colors=ccol, ylim = c(0, 10))
## log-y scale:
p.Li(-1:-20, from=0, to=.99, colors=ccol, ylim = c(.01, 1e7),
     log = "y", yaxt = "n")
if(require(sfsmisc)) eaxis(2) else axis(2)



