library(forecast)


### Name: autoplot.mforecast
### Title: Multivariate forecast plot
### Aliases: autoplot.mforecast autolayer.mforecast plot.mforecast
### Keywords: ts

### ** Examples

library(ggplot2)

lungDeaths <- cbind(mdeaths, fdeaths)
fit <- tslm(lungDeaths ~ trend + season)
fcast <- forecast(fit, h=10)
plot(fcast)
autoplot(fcast)

carPower <- as.matrix(mtcars[,c("qsec","hp")])
carmpg <- mtcars[,"mpg"]
fit <- lm(carPower ~ carmpg)
fcast <- forecast(fit, newdata=data.frame(carmpg=30))
plot(fcast, xlab="Year")
autoplot(fcast, xlab=rep("Year",2))




