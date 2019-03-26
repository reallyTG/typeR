library(copula)


### Name: nacPairthetas
### Title: Pairwise Thetas of Nested Archimedean Copulas
### Aliases: nacPairthetas
### Keywords: utilities

### ** Examples

## test with
options(width=97)

(mm <- rnacModel("Gumbel", d=15, pr.comp = 0.25, order="random"))
stopifnot(isSymmetric(PT <- nacPairthetas(mm)))
round(PT, 2)

## The tau's -- "Kendall's correlation matrix" :
round(copGumbel@tau(PT), 2)

## do this several times:
m1 <- rnacModel("Gumbel", d=15, pr.comp = 1/8, order="seq")
stopifnot(isSymmetric(PT <- nacPairthetas(m1)))
m1; PT

m100 <- rnacModel("Gumbel", d= 100, pr.comp = 1/16, order="seq")
system.time(PT <- nacPairthetas(m100))# how slow {non-optimal algorithm}?
##-- very fast, still!
stopifnot(isSymmetric(PT))
m100

## image(PT)# not ok -- want one color per theta
nt <- length(th0 <- unique(sort(PT[!is.na(PT)])))
th1 <- c(th0[1]/2, th0, 1.25*th0[nt])
ths <- (th1[-1]+th1[-(nt+2)])/2
image(log(PT), breaks = ths, col = heat.colors(nt))

## Nicer and easier:
require(Matrix)
image(as(log(PT),"Matrix"), main = "log( nacPairthetas( m100 ))",
      useAbs=FALSE, useRaster=TRUE, border=NA)



