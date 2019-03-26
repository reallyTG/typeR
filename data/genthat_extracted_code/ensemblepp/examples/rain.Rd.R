library(ensemblepp)


### Name: rain
### Title: Precipitation Observations and Forecasts for Innsbruck
### Aliases: rain
### Keywords: datasets

### ** Examples

## Diagnostic plots similar to Figure 8 in Vannitsem et al. ##

## load and prepare data
data("rain")

rain <- sqrt(rain)

rain$ensmean <- apply(rain[,2:12], 1, mean)
rain$enssd <- apply(rain[,2:12], 1, sd)

## Scatterplot of precipitation by ensemble mean
plot(rain~ensmean, rain, col = gray(0.2, alpha = 0.4), 
  main = "Scatterplot")
abline(0, 1, lty = 2)

## Verification rank histogram
rank <- apply(rain[,1:12], 1, rank)[1,]
hist(rank, breaks = 0:12 + 0.5, main = "Verification Rank Histogram")

## Spread skill relationship
sdcat <- cut(rain$enssd, quantile(rain$enssd, seq(0, 1, 0.2)))
boxplot(abs(rain-ensmean)~sdcat, rain, ylab = "absolute error",
xlab = "ensemble standard deviation", main = "Spread-Skill")

## Histogram
hist(rain$rain, xlab = "square root of precipitation", main = "Histogram")



