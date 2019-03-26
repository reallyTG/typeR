library(gam)


### Name: na.gam.replace
### Title: Missing Data Filter for GAMs
### Aliases: na.gam.replace
### Keywords: models regression nonparametric smooth

### ** Examples

data(airquality)
gam(Ozone^(1/3) ~ lo(Solar.R) + lo(Wind, Temp), data=airquality, na=na.gam.replace)



