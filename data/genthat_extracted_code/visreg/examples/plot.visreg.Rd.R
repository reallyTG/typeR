library(visreg)


### Name: plot.visreg
### Title: Visualization of regression functions
### Aliases: plot.visreg

### ** Examples

fit <- lm(Ozone ~ Solar.R + Wind + Temp,data=airquality)
visreg(fit, "Wind", line=list(col="red"), points=list(cex=1, pch=1))

## Changing appearance
visreg(fit, "Wind", line=list(col="red"), points=list(cex=1, pch=1))

## See ?visreg and http://pbreheny.github.io/visreg for more examples



