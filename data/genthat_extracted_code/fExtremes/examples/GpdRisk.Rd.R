library(fExtremes)


### Name: gpdRisk
### Title: GPD Distributions for Extreme Value Theory
### Aliases: gpdRisk gpdQPlot gpdQuantPlot gpdSfallPlot gpdShapePlot
###   gpdTailPlot gpdRiskMeasures tailPlot tailSlider tailRisk
### Keywords: distribution

### ** Examples

## Load Data:
   danish = as.timeSeries(data(danishClaims))

## Tail Plot:
   x = as.timeSeries(data(danishClaims))
   fit = gpdFit(x, u = 10)
   tailPlot(fit)

## Try Tail Slider:
   # tailSlider(x)   

## Tail Risk:
   tailRisk(fit)



