library(BayesX)


### Name: Interface between sp and bnd format
### Title: Convert sp and bnd format into each other
### Aliases: sp2bnd bnd2sp
### Keywords: spatial

### ** Examples

## bnd to sp:
germany <- read.bnd(system.file("examples/germany2001.bnd", package="BayesX"))
spGermany <- bnd2sp(germany)

## plot the result together with the neighborhood graph
library(sp)
plot(spGermany)
library(spdep)
nbGermany <- poly2nb(spGermany)
plot(nbGermany, coords=coordinates(spGermany), add=TRUE)

## example with one region inside another
spExample <- spGermany[c("7211", "7235"), ]
plot(spExample)
plot(poly2nb(spExample), coords=coordinates(spExample), add=TRUE)

## now back from sp to bnd:
bndGermany <- sp2bnd(spGermany)
drawmap(map=bndGermany)

## compare names and number of polygons
stopifnot(identical(names(bndGermany),
                    names(germany)),
          identical(length(bndGermany),
                    length(germany)))

## compare contains-relations
surrounding <- attr(bndGermany, "surrounding")
whichInner <- which(sapply(surrounding, length) > 0L)
bndContainsData <- data.frame(inner=names(bndGermany)[whichInner],
                              outer=unlist(surrounding))

surrounding <- attr(germany, "surrounding")
whichInner <- which(sapply(surrounding, length) > 0L)
originalContainsData <- data.frame(inner=names(germany)[whichInner],
                                   outer=unlist(surrounding))

stopifnot(all(bndContainsData[order(bndContainsData$inner), ] ==
              originalContainsData[order(originalContainsData$inner), ]))



