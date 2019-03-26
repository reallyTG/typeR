library(WindCurves)


### Name: validate.curve
### Title: A Validate.curve function
### Aliases: validate.curve

### ** Examples

s <- pcurves$Speed
p <- pcurves$`Nordex N90`
da <- data.frame(s,p)
x <- fitcurve(da)
validate.curve(x)



