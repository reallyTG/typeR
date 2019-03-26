library(RiverLoad)


### Name: rsquared.period
### Title: Coefficient of determination for period based regression
###   analyses
### Aliases: rsquared.period
### Keywords: regression

### ** Examples

data("flow.data3","conc.data3")
union<-db.union(flow.data3, conc.data3)
rsquared.period(union,1, "month")
rsquared.period(union,1, "year")



