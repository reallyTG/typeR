library(GSIF)


### Name: AWCPTF
### Title: Available soil water capacity
### Aliases: AWCPTF

### ** Examples

SNDPPT = 30 
SLTPPT = 25 
CLYPPT = 48 
ORCDRC = 23 
BLD = 1200 
CEC = 12 
PHIHOX = 6.4
x <- AWCPTF(SNDPPT, SLTPPT, CLYPPT, ORCDRC, BLD, CEC, PHIHOX)
str(x)
attr(x, "coef")

## predict AWC for AfSP DB profile:
data(afsp)
names(afsp$horizons)
## profile of interest:
sel <- afsp$horizons$SOURCEID=="NG 28440_Z5"
hor <- afsp$horizons[sel,]
## replace missing values:
BLDf <- ifelse(is.na(hor$BLD), 
   mean(hor$BLD, na.rm=TRUE), hor$BLD)
hor <- cbind(hor, AWCPTF(hor$SNDPPT, hor$SLTPPT, 
  hor$CLYPPT, hor$ORCDRC, BLD=BLDf*1000, hor$CEC, 
  hor$PHIHOX))
str(hor)



