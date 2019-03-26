library(visreg)


### Name: plot.visreg2d
### Title: Visualization of regression functions for two variables
### Aliases: plot.visreg2d

### ** Examples

fit <- lm(Ozone ~ Solar.R + Wind + Temp + I(Wind^2) + I(Temp^2) +
I(Wind*Temp)+I(Wind*Temp^2) + I(Temp*Wind^2) + I(Temp^2*Wind^2),
data=airquality)

visreg2d(fit, x="Wind", y="Temp", plot.type="image")
visreg2d(fit, x="Wind", y="Temp", plot.type="image",
         color=c("purple", "green", "red"))
visreg2d(fit, x="Wind", y="Temp", plot.type="persp")

## Requires the rgl package
## Not run: 
##D visreg2d(fit,x="Wind",y="Temp",plot.type="rgl")
## End(Not run)

## Requires the ggplot2 package
## Not run: 
##D visreg2d(fit, x="Wind", y="Temp", plot.type="gg")
## End(Not run)




