library(panelAR)


### Name: plot.panelAR
### Title: Plot Panel Structure
### Aliases: plot.panelAR

### ** Examples

data(WhittenWilliams)
# expect warning urging to use 'complete.case=FALSE'
out <- panelAR(milex_gdp~lag_milex_gdp+GOV_rl+gthreat+GOV_min+GOV_npty+election_yr+
lag_real_GDP_gr+cinclag+lag_alliance+lag_cinc_ratio+lag_us_change_milex_gdp, 
data=WhittenWilliams, panelVar="ccode", timeVar="year", autoCorr="psar1", 
panelCorrMethod="pcse", complete.case=TRUE)

par(cex.axis=0.6)
plot(out, rot.axis=c(45,0))



