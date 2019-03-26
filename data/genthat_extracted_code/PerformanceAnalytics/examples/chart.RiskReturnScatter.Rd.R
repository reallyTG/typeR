library(PerformanceAnalytics)


### Name: chart.RiskReturnScatter
### Title: scatter chart of returns vs risk for comparing multiple
###   instruments
### Aliases: chart.RiskReturnScatter

### ** Examples


data(edhec)
chart.RiskReturnScatter(edhec, Rf = .04/12)
chart.RiskReturnScatter(edhec, Rf = .04/12, add.boxplots = TRUE)




