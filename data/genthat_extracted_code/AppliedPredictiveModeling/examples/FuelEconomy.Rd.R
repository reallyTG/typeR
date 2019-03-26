library(AppliedPredictiveModeling)


### Name: FuelEconomy
### Title: Fuel Economy Data
### Aliases: cars2010 cars2011 cars2012
### Keywords: datasets

### ** Examples

data(FuelEconomy)

library(lattice)

### Plot shown in the text:

cars2010 <- cars2010[order(cars2010$EngDispl),]
cars2011 <- cars2011[order(cars2011$EngDispl),]

cars2010a <- cars2010
cars2010a$Year <- "2010 Model Year"
cars2011a <- cars2011
cars2011a$Year <- "2011 Model Year"

plotData <- rbind(cars2010a, cars2011a)

plotTheme <- bookTheme(FALSE)
plotTheme$plot.symbol$col <- rgb(.2, .2, .2, .5)
plotTheme$plot.symbol$cex <- 0.7
trellis.par.set(plotTheme)

xyplot(FE ~ EngDispl|Year, plotData,
       xlab = "Engine Displacement",
       ylab = "Fuel Efficiency (MPG)",
       between = list(x = 1.2))




