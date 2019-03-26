library(HRW)


### Name: UtahPEF
### Title: Peak expiratory flow in Utah, U.S.A.
### Aliases: UtahPEF

### ** Examples

library(HRW) ; data(UtahPEF)
if (require("lattice"))
   print(xyplot(devPEF ~ PM10withMA5|as.factor(idnum),data = UtahPEF))



