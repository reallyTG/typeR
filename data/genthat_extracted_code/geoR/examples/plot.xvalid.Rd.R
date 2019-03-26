library(geoR)


### Name: plot.xvalid
### Title: Plot Cross-Validation Results
### Aliases: plot.xvalid
### Keywords: spatial dplot

### ** Examples

wls <- variofit(variog(s100, max.dist = 1), ini = c(.5, .5), fix.n = TRUE)
xvl <- xvalid(s100, model = wls)
#
op <- par(no.readonly = TRUE)
par(mfcol = c(3,2))
par(mar = c(3,3,0,1))
par(mgp = c(2,1,0))
plot(xvl, error = FALSE, ask = FALSE)
plot(xvl, std.err = FALSE, ask = FALSE)
par(op)



