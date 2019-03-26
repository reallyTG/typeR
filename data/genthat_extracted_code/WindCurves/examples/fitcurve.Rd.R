library(WindCurves)


### Name: fitcurve
### Title: A fitcurve function
### Aliases: fitcurve

### ** Examples

data(pcurves)
s <- pcurves$Speed
p <- pcurves$`Nordex N90`
da <- data.frame(s,p)
fitcurve(da)



