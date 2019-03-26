library(RSEIS)


### Name: seiscols
### Title: Set colors for seismic display
### Aliases: seiscols
### Keywords: misc

### ** Examples


data(GH)

GH$pcol <- seiscols(GH)
swig(GH, sel=which(GH$COMPS=="V"),    WIN=c(3, 10), SHOWONLY=TRUE)

xcol <-  seiscols(GH, acols=c("black", "darkmagenta", "forestgreen") )

GH$pcol <- xcol

swig(GH, sel=which(GH$COMPS=="V"), , SHOWONLY=TRUE)





