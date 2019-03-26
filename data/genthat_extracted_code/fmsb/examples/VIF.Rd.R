library(fmsb)


### Name: VIF
### Title: Calculate variance inflation factor (VIF) from the result of lm.
### Aliases: VIF

### ** Examples

 # the target multiple regression model
 res <- lm(Ozone ~ Wind+Temp+Solar.R, data=airquality)
 summary(res)
 # checking multicolinearity for independent variables.
 VIF(lm(Wind ~ Temp+Solar.R, data=airquality))
 VIF(lm(Temp ~ Wind+Solar.R, data=airquality))
 VIF(lm(Solar.R ~ Wind+Temp, data=airquality))



