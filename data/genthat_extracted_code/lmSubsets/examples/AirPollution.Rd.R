library(lmSubsets)


### Name: AirPollution
### Title: Air Pollution and Mortality
### Aliases: AirPollution
### Keywords: datasets

### ** Examples

## load data (with logs for relative potentials)
data("AirPollution", package = "lmSubsets")
for (i in 12:14)  AirPollution[[i]] <- log(AirPollution[[i]])

## fit subsets
lm_all <- lmSubsets(mortality ~ ., data = AirPollution)
plot(lm_all)

## refit best model
lm6 <- refit(lm_all, size = 6)
summary(lm6)



