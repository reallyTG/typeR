## ---- include=FALSE------------------------------------------------------
library(visreg)
knitr::opts_knit$set(aliases=c(h = 'fig.height', w = 'fig.width'))

## ------------------------------------------------------------------------
fit <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)

## ---- h=5, w=5-----------------------------------------------------------
visreg(fit, "Wind")

## ------------------------------------------------------------------------
airquality$Heat <- cut(airquality$Temp, 3, labels=c("Cool","Mild","Hot"))
fit <- lm(Ozone~ Solar.R + Wind*Heat, data=airquality)

## ---- h=4, w=9, out.width='100%'-----------------------------------------
visreg(fit, "Wind", by="Heat")

## ---- h=5, w=5-----------------------------------------------------------
visreg(fit, "Wind", by="Heat", overlay=TRUE)

## ---- h=5, w=6-----------------------------------------------------------
fit <- lm(Ozone~ poly(Wind, 2)*poly(Temp, 2), data=airquality)
visreg2d(fit, "Wind", "Temp")

