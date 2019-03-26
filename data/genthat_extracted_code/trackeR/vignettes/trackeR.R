### R code from vignette source 'trackeR.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: preliminaries
###################################################
options(width = 70, prompt = "R> ", continue = "+  ", useFancyQuotes = FALSE)
library("trackeR")
library("ggplot2")
data("runs", package = "trackeR")
set.seed(403)
cache <- FALSE


###################################################
### code chunk number 2: trackeR.Rnw:1821-1825
###################################################
filepath <- system.file("extdata/tcx", "2013-06-01-183220.TCX",
                        package = "trackeR")
runDF <- readTCX(file = filepath, timezone = "GMT")
str(runDF)


###################################################
### code chunk number 3: trackeR.Rnw:2438-2439
###################################################
runTr0 <- trackeRdata(runDF)


###################################################
### code chunk number 4: trackeR.Rnw:2447-2448
###################################################
runTr0


###################################################
### code chunk number 5: trackeR.Rnw:2456-2458
###################################################
runTr1 <- readContainer(filepath, type = "tcx", timezone = "GMT")
identical(runTr0, runTr1)


###################################################
### code chunk number 6: trackeR.Rnw:2467-2470
###################################################
gpxDir <- system.file("extdata/gpx", package = "trackeR")
workouts <- readDirectory(gpxDir, verbose = FALSE)
get_sport(workouts)


###################################################
### code chunk number 7: dataLoad
###################################################
data("run", package = "trackeR")
data("runs", package = "trackeR")


###################################################
### code chunk number 8: dataLoad0 (eval = FALSE)
###################################################
## data("run", package = "trackeR")
## data("runs", package = "trackeR")


###################################################
### code chunk number 9: trackeR.Rnw:2518-2519 (eval = FALSE)
###################################################
## plot(runs, session = 1:3)


###################################################
### code chunk number 10: defaultPlot
###################################################
plot(runs, session = 1:3)


###################################################
### code chunk number 11: trackeR.Rnw:2545-2546 (eval = FALSE)
###################################################
## plotRoute(runs, session = 4, zoom = 13)


###################################################
### code chunk number 12: summarySessionsPrint
###################################################
summary(runs, session = 1:2)
runSummary <- summary(runs, session = 1)
print(runSummary, digits = 3)


###################################################
### code chunk number 13: summarySessions (eval = FALSE)
###################################################
## runSummaryFull <- summary(runs)
## plot(runSummaryFull, group = c("total", "moving"),
##   what = c("avgSpeed", "distance", "duration", "avgHeartRate"))


###################################################
### code chunk number 14: summarySessionsPlot
###################################################
runSummaryFull <- summary(runs)
plot(runSummaryFull, group = c("total", "moving"),
  what = c("avgSpeed", "distance", "duration", "avgHeartRate"))


###################################################
### code chunk number 15: zones (eval = FALSE)
###################################################
## runZones <- zones(runs[1:4], what = "speed",
##   breaks = list(speed = c(0, 2:6, 12.5)))
## runZones <- zones(runs[1:4], breaks = list(speed = c(0, 2:6, 12.5)))
## runZones <- zones(runs[1:4], what = "speed", breaks = c(0, 2:6, 12.5))
## plot(runZones)


###################################################
### code chunk number 16: zonesPlot
###################################################
runZones <- zones(runs[1:4], what = "speed",
  breaks = list(speed = c(0, 2:6, 12.5)))
runZones <- zones(runs[1:4], breaks = list(speed = c(0, 2:6, 12.5)))
runZones <- zones(runs[1:4], what = "speed", breaks = c(0, 2:6, 12.5))
plot(runZones)


###################################################
### code chunk number 17: Wprime (eval = FALSE)
###################################################
## wexp <- Wprime(runs, session = 11, quantity = "expended",
##   cp = 4, version = "2012")
## plot(wexp, scaled = TRUE)


###################################################
### code chunk number 18: WprimePlot2
###################################################
wexp <- Wprime(runs, session = 11, quantity = "expended", cp = 4, version = "2012")
plot(wexp, scaled = TRUE)


###################################################
### code chunk number 19: distrProfiles (eval = FALSE)
###################################################
## dProfile <- distributionProfile(runs, session = 1:4,
##   what = c("speed", "heart_rate"),
##   grid = list(speed = seq(0, 12.5, by = 0.05), heart_rate = seq(0, 250)))
## plot(dProfile, multiple = TRUE)


###################################################
### code chunk number 20: dprofilePlot
###################################################
dProfile <- distributionProfile(runs, session = 1:4,
  what = c("speed", "heart_rate"),
  grid = list(speed = seq(0, 12.5, by = 0.05), heart_rate = seq(0, 250)))
plot(dProfile, smooth = FALSE, multiple = TRUE)


###################################################
### code chunk number 21: concentrationProfiles (eval = FALSE)
###################################################
## cProfile <- concentrationProfile(dProfile, what = "speed")
## plot(cProfile, multiple = TRUE, smooth = TRUE)


###################################################
### code chunk number 22: cprofilePlot
###################################################
cProfile <- concentrationProfile(dProfile, what = "speed")
plot(cProfile, multiple = TRUE, smooth = TRUE)
## cProfileS <- concentrationProfile(dProfileS)
## plot(cProfileS, what = "speed", smooth = FALSE, multiple = TRUE)


###################################################
### code chunk number 23: trackeR.Rnw:3025-3028
###################################################
subset(getUnits(runs), sport == "running")
runTr2 <- changeUnits(run, variable = "speed", unit = "mi_per_h", sport = "running")
subset(getUnits(runTr2), sport == "running")


###################################################
### code chunk number 24: summarySessionsUnits
###################################################
m_per_s2ft_per_h <- function(x) x * 3937/1200 * 3600
changeUnits(runSummary, variable = "speed", unit = "ft_per_h")


###################################################
### code chunk number 25: thresholdPlots (eval = FALSE)
###################################################
## plot(runs, session = 4, what = "speed", threshold = FALSE)
## plot(runs, session = 4, what = "speed")
## plot(runs, session = 4, what = "speed", smooth = TRUE, fun = "median",
##   width = 20)
## run4 <- threshold(runs[4])
## run4S <- smoother(run4, what = "speed", fun = "median", width = 20)
## plot(run4S, what = "speed", smooth = FALSE)


###################################################
### code chunk number 26: thresholdPlots1
###################################################
plot(runs, session = 4, what = "speed", threshold = FALSE)


###################################################
### code chunk number 27: thresholdPlots2
###################################################
plot(runs, session = 4, what = "speed") + ggplot2::expand_limits(y = c(0, 21))


###################################################
### code chunk number 28: thresholdPlots3
###################################################
plot(runs, session = 4, what = "speed", smooth = TRUE, fun = "median", width = 20, cores = 2) + ggplot2::expand_limits(y = c(0, 12.5))


###################################################
### code chunk number 29: thresholdPlots4
###################################################
run4 <- threshold(runs[4])
run4S <- smoother(run4, what = "speed", fun = "median", width = 20, cores = 2)
plot(run4S, what = "speed", smooth = FALSE) + ggplot2::expand_limits(y = c(0, 12.5))


###################################################
### code chunk number 30: cP (eval = FALSE)
###################################################
## cProfile1 <- concentrationProfile(runs,  what = "speed",
##                                   limits = list(speed = c(0, 12.5)))
## ridges(cProfile1)


###################################################
### code chunk number 31: cpPlot
###################################################
cProfile1 <- concentrationProfile(runs,  what = "speed",
                                  limits = list(speed = c(0, 12.5)))
ridges(cProfile1)


###################################################
### code chunk number 32: AppData
###################################################
library("trackeR")
data("runs", package = "trackeR")
runsSummary <- summary(runs)


###################################################
### code chunk number 33: casestudyData (eval = FALSE)
###################################################
## library("trackeR")
## data("runs", package = "trackeR")
## runsT <- threshold(runs)
## dpRuns <- distributionProfile(runsT, what = "speed")
## dpRunsS <- smoother(dpRuns)
## cpRuns <- concentrationProfile(dpRunsS)
## plot(cpRuns, multiple = TRUE, smooth = FALSE)


###################################################
### code chunk number 34: AppCPplot
###################################################
library("trackeR")
data("runs", package = "trackeR")
runsT <- threshold(runs)
dpRuns <- distributionProfile(runsT, what = "speed")
dpRunsS <- smoother(dpRuns)
cpRuns <- concentrationProfile(dpRunsS)
plot(cpRuns, multiple = TRUE, smooth = FALSE) #+ theme(legend.position = "none")


###################################################
### code chunk number 35: AppFunPrep
###################################################
library("fda")
cpFd <- profile2fd(cpRuns, what = "speed")
sppca <- pca.fd(cpFd, nharm = 4)
varprop <- round(sppca$varprop * 100); names(varprop) <- 1:4
varprop


###################################################
### code chunk number 36: AppHarmonicsPlotSpeed
###################################################
## refit fPCA so that trackeR's plot method is used
sppca <- funPCA(cpRuns, what = "speed", nharm = 4)
pp <- FALSE ## dotted = -, dashed = +
plot(sppca, harm = 1:2, pointplot = pp)


###################################################
### code chunk number 37: AppScoresPlot1
###################################################
## plot scores vs summary statistics
scoresSP <- data.frame(sppca$scores)
names(scoresSP) <- paste0("speed_pc", 1:4)
d <- cbind(runsSummary, scoresSP)

library("ggplot2")
## pc1 ~ session duration (moving)
d$durationMoving <- as.numeric(d$durationMoving)
ggplot(d) + geom_point(aes(x = durationMoving, y = speed_pc1)) + theme_bw() + labs(x = "duration moving [min]", y = "PC1")


###################################################
### code chunk number 38: AppScoresPlot2
###################################################
## pc2 ~ avg speed (moving)
ggplot(d) + geom_point(aes(x = avgSpeedMoving, y = speed_pc2)) + theme_bw() + labs(x = "average speed moving [m/s]", y = "PC2")


