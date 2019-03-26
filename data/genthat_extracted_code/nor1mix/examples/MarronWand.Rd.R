library(nor1mix)


### Name: MarronWand
### Title: Marron-Wand Densities as 'norMix' Objects
### Aliases: MarronWand MW.nm1 MW.nm2 MW.nm2.old MW.nm3 MW.nm4 MW.nm5
###   MW.nm6 MW.nm7 MW.nm8 MW.nm9 MW.nm10 MW.nm11 MW.nm12 MW.nm13 MW.nm14
###   MW.nm15 MW.nm16
### Keywords: datasets distribution

### ** Examples

MW.nm10
plot(MW.nm14)

## These are defined as norMix() calls in  ../R/zMarrWand-dens.R
nms <- ls(pat="^MW.nm", "package:nor1mix")
nms <- nms[order(as.numeric(substring(nms,6)))]
for(n in nms) {
   cat("\n",n,":\n"); print(get(n, "package:nor1mix"))
}

## Plot all of them:
op <- par(mfrow=c(4,4), mgp = c(1.2, 0.5, 0), tcl = -0.2,
          mar = .1 + c(2,2,2,1), oma = c(0,0,3,0))
for(n in nms[-17]) plot(get(n, "package:nor1mix"))
mtext("The Marron-Wand Densities", outer= TRUE, font= 2, cex= 1.6)

## and their Q-Q-plots (not really fast):
prob <- ppoints(N <- 100)
for(n in nms[-17])
   qqnorm(qnorMix(prob, get(n, "package:nor1mix")), main = n)
mtext("QQ-plots of Marron-Wand Densities", outer = TRUE,
      font = 2, cex = 1.6)
par(op)

## "object" overview:
cbind(sapply(nms, function(n) { o <- get(n)
      sprintf("%-18s: K =%2d; rng = [%3.1f, %2.1f]",
              attr(o, "name"), nrow(o),
              min(o[,"mu"] - 3*sqrt(o[,"sig2"])),
              max(o[,"mu"] + 3*sqrt(o[,"sig2"])) )
             }))


## Note that Marron-Wand (1992), p.720  give #2 as
MW.nm2
## the parameters of which at first look quite different from
MW.nm2.old
## which has been the definition in the above "Source" Matlab code.
## It's easy to see that mu_{nm2} = -.3 + 1.2   * mu_{paper},
## and correspondigly,   s2_{nm2} =       1.2^2 * s2_{paper}
## such that they are "identical" apart from scale and location:
op. <- par(mfrow=2:1, mgp= c(1.2,0.5,0), tcl= -0.2, mar=.1+c(2,2,2,1))
plot(MW.nm2)
plot(MW.nm2.old)
par(op.)



