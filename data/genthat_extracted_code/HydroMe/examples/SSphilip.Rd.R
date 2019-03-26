library(HydroMe)


### Name: SSphilip
### Title: A Philip's water infiltration model
### Aliases: SSphilip
### Keywords: models manip

### ** Examples

data(infilt)
philip.nis=nlsList(log(Rate)~SSphilip(Time,fc,S)|PlotNo, data=infilt)
coef(philip.nis)



