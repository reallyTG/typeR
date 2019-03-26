library(HydroMe)


### Name: SSgard
### Title: A Gardner water retention model for grouped data
### Aliases: SSgard
### Keywords: models manip

### ** Examples

data(isric)
isric1=isric[1:32,]
gard=nlsList(y~SSgard(x,thr,ths,alp,scal)|Sample, isric1)
coef(gard)



