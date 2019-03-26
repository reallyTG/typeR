library(CalibrateSSB)


### Name: CalibrateSSBpanel
### Title: Calibration weighting and variance estimation for panel data
### Aliases: CalibrateSSBpanel

### ** Examples

z    = AkuData(3000)  # 3000 in each quarter
zPop = AkuData(10000)[,1:7]
lc = rbind(LagDiff(8,4),PeriodDiff(8,4))
rownames(lc) = c("diffQ1","diffQ2","diffQ3","diffQ4","diffYearMean")
CalibrateSSBpanel(grossSample=z,calmodel="~ sex*age", partition=c("year","q"),popData=zPop, 
       y=c("unemployed","workforce"),id="id",wave=c("year","q"),
       numerator="unemployed",linComb=lc)



