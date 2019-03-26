library(stR)


### Name: RSTRmodel
### Title: Robust STR decomposition
### Aliases: RSTRmodel

### ** Examples

## No test: 

n <- 70
trendSeasonalStructure <- list(segments = list(c(0,1)), sKnots = list(c(1,0)))
ns <- 5
seasonalStructure <- list(segments = list(c(0,ns)), sKnots = c(as.list(1:(ns-1)),list(c(ns,0))))
seasons <- (0:(n-1))%%ns + 1
trendSeasons <- rep(1, length(seasons))
times <- seq_along(seasons)
data <- seasons + times/4
set.seed(1234567890)
data <- data + rnorm(length(data), 0, 0.2)
data[20] <- data[20] + 3
data[50] <- data[50] - 5
plot(times, data, type = "l")
timeKnots <- times
trendData <- rep(1, n)
seasonData <- rep(1, n)
trend <- list(data = trendData, times = times, seasons = trendSeasons,
  timeKnots = timeKnots, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))
season <- list(data = seasonData, times = times, seasons = seasons,
  timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(1,0,1))
predictors <- list(trend, season)
rstr <- RSTRmodel(data, predictors, confidence = 0.8)
plot(rstr)
## End(No test)



