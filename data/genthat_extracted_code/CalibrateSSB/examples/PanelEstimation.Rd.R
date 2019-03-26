library(CalibrateSSB)


### Name: PanelEstimation
### Title: Variance estimation for panel data
### Aliases: PanelEstimation

### ** Examples


# Generates data  - two years
z    = AkuData(3000)  # 3000 in each quarter
zPop = AkuData(10000)[,1:7]

# Calibration and "WideFromCalibrate"
b = CalibrateSSB(z,calmodel="~ sex*age", partition=c("year","q"),
        popData=zPop, y=c("unemployed","workforce"))
bWide = WideFromCalibrate(b,CrossStrata(z[,c("year","q")]),z$id)

# Define linear combination matrix
lc = rbind(LagDiff(8,4),PeriodDiff(8,4))
rownames(lc) = c("diffQ1","diffQ2","diffQ3","diffQ4","diffYearMean")
colnames(lc) = colnames(head(bWide$y[[1]]))
lc

# Unemployed: Totals and linear combinations
d1=PanelEstimation(bWide,"unemployed",linComb=lc)  #

# Table of output
cbind(tot=d1$estimates,se=sqrt(d1$varEstimates))
cbind(tot=d1$linCombs,se=sqrt(d1$varLinCombs))

# Ratio: Totals and linear combinations
d=PanelEstimation(bWide,numerator="unemployed",denominator="workforce",linComb=lc)
cbind(tot=d$estimates,se=sqrt(d$varEstimates))
cbind(tot=d$linCombs,se=sqrt(d$varLinCombs))

## Not run: 
##D # Calibration when som population totals unknown (edu)
##D # Leverages in output (will be used to adjust residuals)
##D # Cluster robust estimation (families/famid)
##D b2 = CalibrateSSB(z,popData=zPop,calmodel="~ edu*sex + sex*age",
##D            partition=c("year","q"), y=c("unemployed","workforce"),
##D            leverageOutput=TRUE)
##D b2Wide = WideFromCalibrate(b2,CrossStrata(z[,c("year","q")]),z$id,extra=z$famid)
##D d2 = PanelEstimation(b2Wide,"unemployed",linComb=lc,group=1,estType = "robustModelGroup")
##D cbind(tot=d2$linCombs,se=sqrt(d2$varLinCombs))
## End(Not run)


# Yearly mean before ratio calculation (linComb0)
# and difference between years (linComb)
g=PanelEstimation(bWide,numerator="unemployed",denominator="workforce",
    linComb= LagDiff(2),linComb0=Period(8,4))
cbind(tot=g$linCombs,se=sqrt(g$varLinCombs))




