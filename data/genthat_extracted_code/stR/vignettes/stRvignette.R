## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(cache = FALSE, fig.show = 'hold', fig.width = 7, fig.height = 3)
library(stR)
library(forecast)
library(seasonal)

## ---- fig.height = 4.5---------------------------------------------------
m <- decompose(co2)
plot(m)

## ---- fig.height = 4.5---------------------------------------------------
plot(stl(log(co2), s.window = "periodic", t.window = 30))

## ---- include = FALSE----------------------------------------------------
f = "co2.fit.tbats.RDS"
if(file.exists(f)) {
  co2.fit = readRDS(f)
} else {
  co2.fit <- tbats(co2)
  saveRDS(co2.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  library(forecast)
#  co2.fit <- tbats(co2)

## ---- fig.height = 4.5---------------------------------------------------
plot(co2.fit)

## ------------------------------------------------------------------------
library(seasonal)
co2.fit <- seas(co2)
plot(co2.fit, trend = TRUE)

## ---- include = FALSE----------------------------------------------------
f = "co2.fit.stR.RDS"
if(file.exists(f)) {
  co2.fit = readRDS(f)
} else {
  co2.fit <- AutoSTR(co2)
  saveRDS(co2.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  co2.fit <- AutoSTR(co2)

## ---- fig.height = 4-----------------------------------------------------
plot(co2.fit)

## ------------------------------------------------------------------------
taylor.msts <- msts(log(head(as.vector(taylor), 336*4)),
  seasonal.periods=c(48,48*7,48*7*52.25),
  start=2000+22/52)
plot(taylor.msts, ylab = "Electricity demand")

## ---- include = FALSE----------------------------------------------------
f = "taylor.fit.stR.RDS"
if(file.exists(f)) {
  taylor.fit = readRDS(f)
} else {
  taylor.fit <- AutoSTR(taylor.msts, gapCV = 48, confidence = 0.95)
  saveRDS(taylor.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  taylor.fit <- AutoSTR(taylor.msts, gapCV = 48, confidence = 0.95)

## ---- fig.height = 4.5---------------------------------------------------
plot(taylor.fit)

## ------------------------------------------------------------------------
plot(grocery, ylab = "NSW Grocery Turnover, $ 10^6")

## ------------------------------------------------------------------------
logGr <- log(grocery)
plot(logGr, ylab = "NSW Grocery Turnover, log scale")

## ------------------------------------------------------------------------
trendSeasonalStructure <- list(
  segments = list(c(0,1)),
  sKnots = list(c(1,0)))

## ------------------------------------------------------------------------
seasonalStructure <- list(
  segments = list(c(0,12)),
  sKnots = list(1,2,3,4,5,6,7,8,9,10,11,c(12,0)))

## ------------------------------------------------------------------------
seasons <- as.vector(cycle(logGr))

## ------------------------------------------------------------------------
trendSeasons <- rep(1, length(logGr))

## ------------------------------------------------------------------------
times <- as.vector(time(logGr))

## ------------------------------------------------------------------------
data <- as.vector(logGr)

## ------------------------------------------------------------------------
trendTimeKnots <- seq(
  from = head(times, 1),
  to = tail(times, 1),
  length.out = 175)

## ------------------------------------------------------------------------
seasonTimeKnots <- seq(
  from = head(times, 1),
  to = tail(times, 1),
  length.out = 15)

## ------------------------------------------------------------------------
trendData <- rep(1, length(logGr))
seasonData <- rep(1, length(logGr))

## ------------------------------------------------------------------------
trend <- list(
  name = "Trend",
  data = trendData,
  times = times,
  seasons = trendSeasons,
  timeKnots = trendTimeKnots,
  seasonalStructure = trendSeasonalStructure,
  lambdas = c(0.5,0,0))

## ------------------------------------------------------------------------
season <- list(
  name = "Yearly seasonality",
  data = seasonData,
  times = times,
  seasons = seasons,
  timeKnots = seasonTimeKnots,
  seasonalStructure = seasonalStructure,
  lambdas = c(10,0,0))

## ------------------------------------------------------------------------
predictors <- list(trend, season)

## ---- include = FALSE----------------------------------------------------
f = "gr.fit.stR.RDS"
if(file.exists(f)) {
  gr.fit = readRDS(f)
} else {
  gr.fit <- STR(data, predictors, confidence = 0.95, gap = 1, reltol = 0.00001)
  saveRDS(gr.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  gr.fit <- STR(data, predictors, confidence = 0.95, gap = 1, reltol = 0.00001)

## ---- fig.height=4-------------------------------------------------------
plot(gr.fit, xTime = times, forecastPanels = NULL)

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
season <- list(name = "Yearly seasonality",
               data = seasonData,
               times = times,
               seasons = seasons,
               timeKnots = seasonTimeKnots,
               seasonalStructure = seasonalStructure,
               lambdas = c(1,1,1))
predictors = list(trend, season)

## ---- include = FALSE----------------------------------------------------
f = "gr.fit.2.stR.RDS"
if(file.exists(f)) {
  gr.fit = readRDS(f)
} else {
  gr.fit <- STR(data,
                predictors,
                confidence = 0.95,
                gap = 1,
                reltol = 0.00001)
  saveRDS(gr.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  gr.fit <- STR(data,
#                predictors,
#                confidence = 0.95,
#                gap = 1,
#                reltol = 0.00001)

## ---- fig.height=4-------------------------------------------------------
plot(gr.fit, xTime = times, forecastPanels = NULL)

## ---- fig.height = 4-----------------------------------------------------
outl <- rep(0,length(grocery))
outl[14] <- 900
outl[113] <- -700
tsOutl <- ts(outl, start = c(2000,1), frequency = 12)

## ------------------------------------------------------------------------
logGrOutl <- log(grocery + tsOutl)
plot(logGrOutl, ylab = "Log turnover with outliers")

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
trendSeasonalStructure <- list(segments = list(c(0,1)),
                              sKnots = list(c(1,0)))
seasonalStructure <- list(segments = list(c(0,12)),
                         sKnots  = list(1,2,3,4,5,6,7,8,9,10,11,c(12,0)))
seasons <- as.vector(cycle(logGrOutl))
trendSeasons <- rep(1, length(logGrOutl))
times <- as.vector(time(logGrOutl))
data <- as.vector(logGrOutl)
timeKnots <- times
trendData <- rep(1, length(logGrOutl))
seasonData <- rep(1, length(logGrOutl))
trend <- list(data = trendData,
             times = times,
             seasons = trendSeasons,
             timeKnots = timeKnots,
             seasonalStructure = trendSeasonalStructure,
             lambdas = c(0.1,0,0))
season <- list(data = seasonData,
              times = times,
              seasons = seasons,
              timeKnots = timeKnots,
              seasonalStructure = seasonalStructure,
              lambdas = c(10,0,0))
predictors <- list(trend, season)

## ---- include = FALSE----------------------------------------------------
f = "logGrOutl.stR.RDS"
if(file.exists(f)) {
  fit.str = readRDS(f)
} else {
  fit.str <- STR(as.vector(logGrOutl), predictors, confidence = 0.95, gapCV = 1, reltol = 0.001)
  saveRDS(fit.str, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  fit.str <- STR(as.vector(logGrOutl), predictors, confidence = 0.95, gapCV = 1, reltol = 0.001)

## ---- fig.height = 4-----------------------------------------------------
plot(fit.str, xTime = times, forecastPanels = NULL)

## ---- include = FALSE----------------------------------------------------
f = "logGrOutl.stR.robust.RDS"
if(file.exists(f)) {
  fit.rstr = readRDS(f)
} else {
  fit.rstr <- STR(as.vector(logGrOutl), predictors, confidence = 0.95, gapCV = 1, reltol = 0.001, nMCIter = 200, robust = TRUE)
  saveRDS(fit.rstr, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  fit.rstr <- STR(as.vector(logGrOutl), predictors, confidence = 0.95, gapCV = 1, reltol = 0.001, nMCIter = 200, robust = TRUE)

## ---- fig.height = 4-----------------------------------------------------
plot(fit.rstr, xTime = times, forecastPanels = NULL)

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
times <- as.vector(time(calls))
timeKnots <- seq(min(times), max(times), length.out=25)

trendSeasonalStructure <- list(segments = list(c(0,1)),
                              sKnots = list(c(1,0)))
trendSeasons <- rep(1, length(calls))

sKnotsDays <- as.list(seq(1, 169, length.out = 169))
seasonalStructureDays <- list(segments = list(c(1, 169)),
                             sKnots = sKnotsDays)
seasonsDays <- seq_along(calls) %% 169 + 1

sKnotsWeeks <- as.list(seq(0,169*5, length.out=13*5))
seasonalStructureWeeks <- list(segments = list(c(0, 169*5)),
                              sKnots = sKnotsWeeks)
seasonsWeeks <- seq_along(calls) %% (169*5) + 1

data <- as.vector(calls)
trendData <- rep(1, length(calls))
seasonData <- rep(1, length(calls))

trend <- list(data = trendData,
              times = times,
              seasons = trendSeasons,
              timeKnots = timeKnots,
              seasonalStructure = trendSeasonalStructure,
              lambdas = c(0.02, 0, 0))

seasonDays <- list(data = seasonData,
                   times = times,
                   seasons = seasonsDays,
                   timeKnots = seq(min(times), max(times), length.out=25),
                   seasonalStructure = seasonalStructureDays,
                   lambdas = c(0, 11, 30))

seasonWeeks <- list(data = seasonData,
                    times = times,
                    seasons = seasonsWeeks,
                    timeKnots = seq(min(times), max(times), length.out=25),
                    seasonalStructure = seasonalStructureWeeks,
                    lambdas = c(30, 500, 0.02))

predictors <- list(trend, seasonDays, seasonWeeks)

## ---- include = FALSE----------------------------------------------------
f = "calls.fit.RDS"
if(file.exists(f)) {
  calls.fit = readRDS(f)
} else {
  calls.fit <- STR(data = data,
                   predictors = predictors,
                   confidence = 0.95,
                   reltol = 0.003,
                   nFold = 4,
                   gap = 169)
  saveRDS(calls.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  calls.fit <- STR(data = data,
#                   predictors = predictors,
#                   confidence = 0.95,
#                   reltol = 0.003,
#                   nFold = 4,
#                   gap = 169)

## ---- fig.height = 4-----------------------------------------------------
plot(calls.fit,
     xTime = as.Date("2003-03-03") +
       ((seq_along(data)-1)/169) +
       (((seq_along(data)-1)/169) / 5)*2,
     forecastPanels = NULL)

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
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
WDSeason <- list(name = "Daily seas",
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
                    lambdas = c(1e7,0,0))
Predictors <- list(Trend, WSeason, WDSeason, TrendTempM, TrendTempM2)

## ---- include = FALSE----------------------------------------------------
f = "elec.fit.RDS"
if(file.exists(f)) {
  elec.fit = readRDS(f)
} else {
  elec.fit <- STR(data = Data,
                  predictors = Predictors,
                  confidence = 0.95,
                  gapCV = 48*7)
  saveRDS(elec.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  elec.fit <- STR(data = Data,
#                  predictors = Predictors,
#                  confidence = 0.95,
#                  gapCV = 48*7)

## ---- fig.height = 6-----------------------------------------------------
plot(elec.fit,
     xTime = as.Date("2000-01-11")+((Times-1)/48-10),
     forecastPanels = NULL)

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
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
WDSeason <- list(name = "Daily seas",
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
                    lambdas = c(1e7,0,0))
Predictors <- list(Trend, WSeason, WDSeason, TrendTempM, TrendTempM2)

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
Data[(length(Data)-7*48):length(Data)] <- NA

## ---- include = FALSE----------------------------------------------------
f = "elec.fit.forecasting.RDS"
if(file.exists(f)) {
  elec.fit = readRDS(f)
} else {
  elec.fit <- STR(data = Data,
                  predictors = Predictors,
                  confidence = 0.95,
                  gapCV = 48*7)
  saveRDS(elec.fit, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  elec.fit <- STR(data = Data,
#                  predictors = Predictors,
#                  confidence = 0.95,
#                  gapCV = 48*7)

## ---- fig.height = 7.5---------------------------------------------------
plot(elec.fit,
     xTime = as.Date("2000-01-11")+((Times-1)/48-10),
     forecastPanels = 7)

## ---- fig.height = 4.5---------------------------------------------------
plotBeta(elec.fit, predictorN = 1)

## ---- fig.height = 4.5---------------------------------------------------
plotBeta(elec.fit, predictorN = 2)
plotBeta(elec.fit, predictorN = 3)

## ---- fig.height = 4.5---------------------------------------------------
plotBeta(elec.fit, predictorN = 4)
plotBeta(elec.fit, predictorN = 5)

## ---- echo=TRUE, warning=FALSE, results='hide'---------------------------
Trend <- list(name = "Trend",
              data = TrendData,
              times = Times,
              seasons = TrendSeasons,
              timeKnots = TrendTimeKnots,
              seasonalStructure = TrendSeasonalStructure,
              lambdas = c(150000,0,0))
Predictors <- list(Trend, WSeason, WDSeason, TrendTempM, TrendTempM2)

## ---- include = FALSE----------------------------------------------------
f = "elec.fit.2.forecasting.RDS"
if(file.exists(f)) {
  elec.fit.2 = readRDS(f)
} else {
  elec.fit.2 <- STR(data = Data,
                    predictors = Predictors,
                    confidence = 0.95,
                    gapCV = 48*7)
  saveRDS(elec.fit.2, f, compress = "xz")
}

## ---- eval = FALSE-------------------------------------------------------
#  elec.fit.2 <- STR(data = Data,
#                    predictors = Predictors,
#                    confidence = 0.95,
#                    gapCV = 48*7)

## ---- fig.height = 7.5---------------------------------------------------
plot(elec.fit.2,
     xTime = as.Date("2000-01-11")+((Times-1)/48-10),
     forecastPanels = 7)

## ---- fig.height = 4.5---------------------------------------------------
for(i in 1:5)
  plotBeta(elec.fit.2, predictorN = i)

