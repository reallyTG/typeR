library(stR)


### Name: heuristicSTR
### Title: Automatic STR decomposition with heuristic search of the
###   parameters
### Aliases: heuristicSTR

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

elec.fit <- heuristicSTR(data = Data,
                predictors = Predictors,
                gapCV = 48*7)

plot(elec.fit,
     xTime = as.Date("2000-01-11")+((Times-1)/48-10),
     forecastPanels = NULL)

########################################

TrendSeasonalStructure <- list(segments = list(c(0,1)),
sKnots = list(c(1,0)))
DailySeasonalStructure <- list(segments = list(c(0,48)),
                               sKnots = c(as.list(1:47), list(c(48,0))))
WeeklySeasonalStructure <- list(segments = list(c(0,336)),
                                sKnots = c(as.list(seq(4,332,4)), list(c(336,0))))
WDSeasonalStructure <- list(segments = list(c(0,48), c(100,148)),
                            sKnots = c(as.list(c(1:47,101:147)), list(c(0,48,100,148))))

TrendSeasons <- rep(1, nrow(electricity))
DailySeasons <- as.vector(electricity[,"DailySeasonality"])
WeeklySeasons <- as.vector(electricity[,"WeeklySeasonality"])
WDSeasons <- as.vector(electricity[,"WorkingDaySeasonality"])

Data <- as.vector(electricity[,"Consumption"])
Times <- as.vector(electricity[,"Time"])
TempM <- as.vector(electricity[,"Temperature"])
TempM2 <- TempM^2

TrendTimeKnots <- seq(from = head(Times, 1), to = tail(Times, 1), length.out = 116)
SeasonTimeKnots <- seq(from = head(Times, 1), to = tail(Times, 1), length.out = 24)
SeasonTimeKnots2 <- seq(from = head(Times, 1), to = tail(Times, 1), length.out = 12)

TrendData <- rep(1, length(Times))
SeasonData <- rep(1, length(Times))

Trend <- list(name = "Trend",
              data = TrendData,
              times = Times,
              seasons = TrendSeasons,
              timeKnots = TrendTimeKnots,
              seasonalStructure = TrendSeasonalStructure,
              lambdas = c(1500,0,0))
WSeason <- list(name = "Weekly seas",
                data = SeasonData,
                times = Times,
                seasons = WeeklySeasons,
                timeKnots = SeasonTimeKnots2,
                seasonalStructure = WeeklySeasonalStructure,
                lambdas = c(0.8,0.6,100))
WDSeason <- list(name = "Dayly seas",
                 data = SeasonData,
                 times = Times,
                 seasons = WDSeasons,
                 timeKnots = SeasonTimeKnots,
                 seasonalStructure = WDSeasonalStructure,
                 lambdas = c(0.003,0,240))
TrendTempM <- list(name = "Trend temp Mel",
                   data = TempM,
                   times = Times,
                   seasons = TrendSeasons,
                   timeKnots = TrendTimeKnots,
                   seasonalStructure = TrendSeasonalStructure,
                   lambdas = c(1e7,0,0))
TrendTempM2 <- list(name = "Trend temp Mel^2",
                    data = TempM2,
                    times = Times,
                    seasons = TrendSeasons,
                    timeKnots = TrendTimeKnots,
                    seasonalStructure = TrendSeasonalStructure,
                    lambdas = c(0.01,0,0)) # Starting parameter is too far from the optimal value
Predictors <- list(Trend, WSeason, WDSeason, TrendTempM, TrendTempM2)

elec.fit <- heuristicSTR(data = Data,
                         predictors = Predictors,
                         gapCV = 48*7)

plot(elec.fit,
     xTime = as.Date("2000-01-11")+((Times-1)/48-10),
     forecastPanels = NULL)

plotBeta(elec.fit, predictorN = 4)
plotBeta(elec.fit, predictorN = 5)

## End(No test)



