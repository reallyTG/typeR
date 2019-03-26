library(stR)


### Name: STR
### Title: Automatic STR decomposition
### Aliases: STR

### ** Examples

## No test: 

TrendSeasonalStructure <- list(segments = list(c(0,1)),
sKnots = list(c(1,0)))
WDSeasonalStructure <- list(segments = list(c(0,48), c(100,148)),
                            sKnots = c(as.list(c(1:47,101:147)), list(c(0,48,100,148))))

TrendSeasons <- rep(1, nrow(electricity))
WDSeasons <- as.vector(electricity[,"WorkingDaySeasonality"])

Data <- as.vector(electricity[,"Consumption"])
Times <- as.vector(electricity[,"Time"])
TempM <- as.vector(electricity[,"Temperature"])
TempM2 <- TempM^2

TrendTimeKnots <- seq(from = head(Times, 1), to = tail(Times, 1), length.out = 116)
SeasonTimeKnots <- seq(from = head(Times, 1), to = tail(Times, 1), length.out = 24)

TrendData <- rep(1, length(Times))
SeasonData <- rep(1, length(Times))

Trend <- list(name = "Trend",
              data = TrendData,
              times = Times,
              seasons = TrendSeasons,
              timeKnots = TrendTimeKnots,
              seasonalStructure = TrendSeasonalStructure,
              lambdas = c(1500,0,0))
WDSeason <- list(name = "Dayly seas",
                 data = SeasonData,
                 times = Times,
                 seasons = WDSeasons,
                 timeKnots = SeasonTimeKnots,
                 seasonalStructure = WDSeasonalStructure,
                 lambdas = c(0.003,0,240))
StaticTempM <- list(name = "Temp Mel",
                    data = TempM,
                    times = Times,
                    seasons = NULL,
                    timeKnots = NULL,
                    seasonalStructure = NULL,
                    lambdas = c(0,0,0))
StaticTempM2 <- list(name = "Temp Mel^2",
                     data = TempM2,
                     times = Times,
                     seasons = NULL,
                     timeKnots = NULL,
                     seasonalStructure = NULL,
                     lambdas = c(0,0,0))
Predictors <- list(Trend, WDSeason, StaticTempM, StaticTempM2)

elec.fit <- STR(data = Data,
                predictors = Predictors,
                gapCV = 48*7)

plot(elec.fit,
     xTime = as.Date("2000-01-11")+((Times-1)/48-10),
     forecastPanels = NULL)

#########################################################

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
data[20] <- data[20]+3
data[50] <- data[50]-5
plot(times, data, type = "l")
timeKnots <- times
trendData <- rep(1, n)
seasonData <- rep(1, n)
trend <- list(data = trendData, times = times, seasons = trendSeasons,
  timeKnots = timeKnots, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))
season <- list(data = seasonData, times = times, seasons = seasons,
  timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(1,0,1))
predictors <- list(trend, season)
rstr <- STR(data, predictors, reltol = 0.0000001, gapCV = 10,
                confidence = 0.95, nMCIter = 400, robust = TRUE)
plot(rstr)
## End(No test)



