library(car)


### Name: TransformationAxes
### Title: Axes for Transformed Variables
### Aliases: basicPowerAxis bcPowerAxis bcnPowerAxis yjPowerAxis
###   probabilityAxis
### Keywords: aplot

### ** Examples

UN <- na.omit(UN)
par(mar=c(5, 4, 4, 4) + 0.1) # leave space on right

with(UN, plot(log(ppgdp, 10), log(infantMortality, 10)))
basicPowerAxis(0, base=10, side="above", 
  at=c(50, 200, 500, 2000, 5000, 20000), grid=TRUE, 
  axis.title="GDP per capita")
basicPowerAxis(0, base=10, side="right",
  at=c(5, 10, 20, 50, 100), grid=TRUE, 
  axis.title="infant mortality rate per 1000")

with(UN, plot(bcPower(ppgdp, 0), bcPower(infantMortality, 0)))
bcPowerAxis(0, side="above", 
  grid=TRUE, axis.title="GDP per capita")
bcPowerAxis(0, side="right",
  grid=TRUE, axis.title="infant mortality rate per 1000")

with(UN, qqPlot(logit(infantMortality/1000)))
probabilityAxis()

with(UN, qqPlot(qnorm(infantMortality/1000)))
probabilityAxis(at=c(.005, .01, .02, .04, .08, .16), scale="probit")

qqPlot(bcnPower(Ornstein$interlocks, lambda=1/3, gamma=0.1))
bcnPowerAxis(1/3, 0.1, at=c(o=0, 5, 10, 20, 40, 80))



