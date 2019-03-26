library(HydroMe)


### Name: SSgardner
### Title: A Gardner water retention model
### Aliases: SSgardner
### Keywords: models manip

### ** Examples

data(isric)
isric1=isric[1:32,]
gardner=nlsLM(y~SSgardner(x,thr,ths,alp,nscal), isric1)
gardner



