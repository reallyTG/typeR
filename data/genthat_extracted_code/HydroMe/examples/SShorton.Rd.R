library(HydroMe)


### Name: SShorton
### Title: A Horton water infiltration model
### Aliases: SShorton
### Keywords: models manip

### ** Examples

data(infilt)
infil=infilt[319:751,]
hort.lis=nlsList(log(Rate)~SShorton(Time,fc,f0,lrk)|PlotNo, infil)#Rate is the y variable
hort.lis



