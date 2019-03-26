library(fda)


### Name: phaseplanePlot
### Title: Phase-plane plot
### Aliases: phaseplanePlot
### Keywords: smooth hplot

### ** Examples

goodsbasis <- create.bspline.basis(rangeval=c(1919,2000),
                                   nbasis=161, norder=8)
LfdobjNonDur <- int2Lfd(4)

library(zoo)
logNondurSm <- smooth.basisPar(argvals=index(nondurables),
                y=log10(coredata(nondurables)), fdobj=goodsbasis,
                Lfdobj=LfdobjNonDur, lambda=1e-11)
phaseplanePlot(1964, logNondurSm$fd)




