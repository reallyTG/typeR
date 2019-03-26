library(TippingPoint)


### Name: TippingPoint.formula
### Title: TippingPoint.formula
### Aliases: TippingPoint.formula

### ** Examples

#  See more details in vignette using:
#  vignette("TippingPoint")
TippingPoint(binary~treat, data=tippingdata,
  plot.type = "both", ind.values = TRUE,
  impValuesT  = imputedata[,c("MAR_T2","MCAR_T2")],
  impValuesC = imputedata[,c("MAR_C2","MCAR_C2")],
  impValuesColor =c("red","blue"),
  point.size=0.8,point.shape = 15,
  summary.type = "convex.hull", alpha = 0.95, S=1.5, n.grid = 100,
  HistMeanT = c(0.38,0.4), HistMeanC =  c(0.2,0.55))



