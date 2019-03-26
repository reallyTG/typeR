library(RSEIS)


### Name: SNET.drive
### Title: stereonet representation of particle motion
### Aliases: SNET.drive
### Keywords: hplot iplot

### ** Examples



data("GH")

temp  <-  cbind(GH$JSTR[[1]], GH$JSTR[[2]], GH$JSTR[[3]])

atemp  <- temp[1168:1500, ]
SNET.drive(atemp, pmolabs = c("Vertical", "North", "East"), STAMP = "")




