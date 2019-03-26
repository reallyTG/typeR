library(forecast)


### Name: plot.ets
### Title: Plot components from ETS model
### Aliases: plot.ets autoplot.ets
### Keywords: hplot

### ** Examples


fit <- ets(USAccDeaths)
plot(fit)
plot(fit,plot.type="single",ylab="",col=1:3)

library(ggplot2)
autoplot(fit)




