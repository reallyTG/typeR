library(RSEIS)


### Name: GAZI
### Title: Get azimuthal particle motion
### Aliases: GAZI
### Keywords: hplot

### ** Examples


data("GH")


temp  <-  cbind(GH$JSTR[[4]], GH$JSTR[[5]], GH$JSTR[[6]])

pmolabs <- c("Vertical", "North", "East")


 G   <-  GAZI(temp, dt =GH$dt[4]  , comp = pmolabs, sta = GH$STNS[4] ,
az = 0, len =75, shift = 10, prev = 1)




