library(panelAR)


### Name: run.analysis
### Title: Run Analysis for Panel Data
### Aliases: run.analysis

### ** Examples

data(WhittenWilliams)
# expect warning urging to use 'complete.case=FALSE'
out <- panelAR(milex_gdp~lag_milex_gdp+GOV_rl+gthreat+GOV_min+GOV_npty+election_yr+
lag_real_GDP_gr+cinclag+lag_alliance+lag_cinc_ratio+lag_us_change_milex_gdp, 
data=WhittenWilliams, panelVar="ccode", timeVar="year", autoCorr="psar1", 
panelCorrMethod="pcse", complete.case=TRUE)

run.analysis(out) # overview
run.analysis(out)$runs # details of each run



