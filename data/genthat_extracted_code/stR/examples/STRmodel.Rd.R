library(stR)


### Name: STRmodel
### Title: STR decomposition
### Aliases: STRmodel

### ** Examples

n <- 50
trendSeasonalStructure <- list(segments = list(c(0,1)), sKnots = list(c(1,0)))
ns <- 5
seasonalStructure <- list(segments = list(c(0,ns)), sKnots = c(as.list(1:(ns-1)),list(c(ns,0))))
seasons <- (0:(n-1))%%ns + 1
trendSeasons <- rep(1, length(seasons))
times <- seq_along(seasons)
data <- seasons + times/4
plot(times, data, type = "l")
timeKnots <- times
trendData <- rep(1, n)
seasonData <- rep(1, n)
trend <- list(data = trendData, times = times, seasons = trendSeasons,
  timeKnots = timeKnots, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))
season <- list(data = seasonData, times = times, seasons = seasons,
  timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(10,0,0))
predictors <- list(trend, season)

str1 <- STRmodel(data, predictors)
plot(str1)

data[c(3,4,7,20,24,29,35,37,45)] <- NA
plot(times, data, type = "l")
str2 <- STRmodel(data, predictors)
plot(str2)




