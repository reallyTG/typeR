library(spTest)


### Name: WRFG
### Title: Average temperature from WRFG RCM output from NARCCAP
### Aliases: WRFG
### Keywords: datasets

### ** Examples

data(WRFG)
library(fields)
image.plot(WRFG$lon-360, WRFG$lat, WRFG$WRFG.NCEP.tas)
world(add = TRUE)



