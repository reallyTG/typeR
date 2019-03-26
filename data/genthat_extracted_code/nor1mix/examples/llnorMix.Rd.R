library(nor1mix)


### Name: llnorMix
### Title: Likelihood, Parametrization and EM-Steps For 1D Normal Mixtures
### Aliases: llnorMix par2norMix nM2par estep.nm mstep.nm emstep.nm
### Keywords: models

### ** Examples

(obj <- MW.nm10) # "the Claw" -- m = 6 components
length(pp <- nM2par(obj)) # 17 == (3*6) - 1
par2norMix(pp)
## really the same as the initial 'obj' above

## Log likelihood (of very artificial data):
llnorMix(pp, x = seq(-2, 2, length=1000))
set.seed(47)## of more realistic data:
x <- rnorMix(1000, obj)
llnorMix(pp, x)

## Consistency check :  nM2par()  and  par2norMix()  are inverses
all.EQ <- function(x,y, tol = 1e-15, ...) all.equal(x,y, tolerance=tol, ...)
stopifnot(all.EQ(pp, nM2par(par2norMix(pp))),
          all.EQ(obj, par2norMix(nM2par(obj)),
                    check.attributes=FALSE),
          ## Direct computation of log-likelihood:
          all.EQ(sum(dnorMix(x, obj, log=TRUE)),
                    llnorMix(pp, x))  )

## E- and M- steps : ------------------------------
rE1 <- estep.nm(x, obj)
rE2 <- estep.nm(x, par=pp) # the same as rE1
z <- rE1
str( rM <-  mstep.nm(x, z))
   (rEM <- emstep.nm(x, obj))

stopifnot(all.EQ(rE1, rE2),
          all.EQ(rEM, do.call(norMix, c(rM, name=""))))



