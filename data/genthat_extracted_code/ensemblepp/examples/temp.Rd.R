library(ensemblepp)


### Name: temp
### Title: Minimum Temperature Observations and Forecasts for Innsbruck
### Aliases: temp
### Keywords: datasets

### ** Examples

## Diagnostic plots similar to Figure 1 and 3 in Vannitsem et al. ##

## load and prepare data
data("temp")

temp$ensmean <- apply(temp[,2:12], 1, mean)
temp$enssd <- apply(temp[,2:12], 1, sd)

## Scatterplot of minimum temperature observation by ensemble mean
plot(temp~ensmean, temp, main = "Scatterplot")
abline(0, 1, lty = 2)

## Verification rank histogram
rank <- apply(temp[,1:12], 1, rank)[1,]
hist(rank, breaks = 0:12 + 0.5, main = "Verification Rank Histogram")

## Spread skill relationship
sdcat <- cut(temp$enssd, breaks = quantile(temp$enssd, seq(0, 1, 0.2)))
boxplot(abs(temp-ensmean)~sdcat, temp, ylab = "absolute error",
xlab = "ensemble standard deviation", main = "Spread-Skill")

## Histogram
hist(temp$temp, xlab = "minimum temperature", main = "Histogram")



