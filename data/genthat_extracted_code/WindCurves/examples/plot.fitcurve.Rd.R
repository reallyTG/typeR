library(WindCurves)


### Name: plot.fitcurve
### Title: A function to plot the curves fitted with fitcurve() function
### Aliases: plot.fitcurve

### ** Examples

s <- pcurves$Speed
p <- pcurves$`Nordex N90`
da <- data.frame(s,p)
x <- fitcurve(da)
plot(x)




