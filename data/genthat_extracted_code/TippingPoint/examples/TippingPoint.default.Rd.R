library(TippingPoint)


### Name: TippingPoint.default
### Title: Default method for TippingPoint
### Aliases: TippingPoint.default

### ** Examples

#  See more details in vignette using:
#  vignette("TippingPoint")
TippingPoint(outcome=tippingdata$binary,treat= tippingdata$treat,
 plot.type = "p.value",ind.values = TRUE,
 impValuesT  = imputedata[,c("MAR_T2","MCAR_T2")],
 impValuesC = imputedata[,c("MAR_C2","MCAR_C2")],
 impValuesColor = RColorBrewer::brewer.pal(8,"Accent")[c(4,6)],
 summary.type = "credible.region", alpha = 0.95,
 S=1.5, n.grid = 100, HistMeanT = c(0.38,0.4), HistMeanC =  c(0.2,0.55))



