library(RSEIS)


### Name: getvertsorder
### Title: Get Order of Picks from P-wave Arrivals
### Aliases: getvertsorder
### Keywords: misc

### ** Examples

data(GH)

vertord <-  getvertsorder(GH$pickfile, GH)

swig(GH,  sel=vertord$sel, WIN=vertord$win,   SHOWONLY=TRUE)





