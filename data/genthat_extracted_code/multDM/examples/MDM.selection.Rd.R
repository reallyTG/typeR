library(multDM)


### Name: MDM.selection
### Title: Selects Models with Outstanding Predictive Ability basing on
###   Multivariate Diebold-Mariano Test.
### Aliases: MDM.selection

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
MDM.selection(realized=ts,evaluated=forecasts,q=10,alpha=0.1,statistic="S",loss.type="AE")



