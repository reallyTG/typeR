library(panelAR)


### Name: panelAR
### Title: Estimation of Linear AR(1) Panel Data Models with
###   Cross-Sectional Heteroskedasticity and/or Correlation
### Aliases: panelAR print.panelAR
### Keywords: regression ts

### ** Examples

# Common AR(1) with PCSE
data(Rehm)
out <- panelAR(NURR ~ gini + mean_ur + selfemp + cum_right + tradeunion + deficit + 
tradeopen + gdp_growth, data=Rehm, panelVar='ccode', timeVar='year', autoCorr='ar1', 
panelCorrMethod='pcse', rho.na.rm=TRUE, panel.weight='t-1', bound.rho=TRUE)
summary(out)

# Panel-specific AR(1) with PCSE
data(WhittenWilliams)
# expect warning urging to use 'complete.case=FALSE' 
out2 <- panelAR(milex_gdp~lag_milex_gdp+GOV_rl+gthreat+GOV_min+GOV_npty+election_yr+
lag_real_GDP_gr+cinclag+lag_alliance+lag_cinc_ratio+lag_us_change_milex_gdp, 
data=WhittenWilliams, panelVar="ccode", timeVar="year", autoCorr="psar1", 
panelCorrMethod="pcse", complete.case=TRUE) 
summary(out2)
summary(out2)$rho

# Panel-specific AR(1) correlation with PWLS	
data(BrooksKurtz)
out3 <- panelAR(kaopen ~ ldiffpeer + ldiffisi + ldiffgrowth + ldiffinflation + 
ldiffneg + ldiffembi + limf + isi_objective + partisan + checks +  lusffr + 
linflation + lbankra + lcab + lgrowth +  ltradebalance + lngdpcap + lngdp + 
brk + timetrend + y1995, data=BrooksKurtz, panelVar='country', timeVar='year', 
autoCorr='psar1', panelCorrMethod='pwls',rho.na.rm=TRUE, panel.weight='t', 
seq.times=TRUE)
summary(out3)



