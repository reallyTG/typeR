## ---- vignette, eval = FALSE---------------------------------------------
#  vignette("trackeR", package = "trackeR")

## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 7
)

## ---- runDF, message = FALSE---------------------------------------------
library("trackeR")
filepath <- system.file("extdata/tcx/", "2013-06-01-183220.TCX", package = "trackeR")
runDF <- readTCX(file = filepath, timezone = "GMT")

## ---- str_runDF----------------------------------------------------------
str(runDF)

## ---- runTr0-------------------------------------------------------------
runTr0 <- trackeRdata(runDF)

## ---- runTr1-------------------------------------------------------------
runTr1 <- read_container(filepath, type = "tcx", timezone = "GMT")
identical(runTr0, runTr1)

## ---- runs---------------------------------------------------------------
data("runs", package = "trackeR")

## ---- plot_runs, fig.width = 7, fig.height = 5---------------------------
plot(runs, session = 1:7)

## ---- plot_runs_2, fig.width = 7, fig.height = 5-------------------------
plot(runs, session = 8, what = c("altitude", "pace"))

## ---- plotRoute, message = FALSE, warning = FALSE, fig.width = 7, fig.height = 7----
tryCatch(plot_route(runs, session = 1, source = "stamen"),
         error = function(x) "Failed to donwload map data")

## ---- leafletRoute, fig.width = 7, fig.height = 7------------------------
tryCatch(leaflet_route(runs, session = c(1, 6, 12)),
         error = function(x) "Failed to donwload map data")

## ---- summary------------------------------------------------------------
summary(runs, session = 1, moving_threshold = c(cycling = 2, running = 1, swimming = 0.5))

## ---- plot_summary, fig.width = 7, fig.height = 7------------------------
runs_summary <- summary(runs)
plot(runs_summary, group = c("total", "moving"),
     what = c("avgSpeed", "distance", "duration", "avgHeartRate"))

## ---- timeline, fig.width = 7, fig.height = 7----------------------------
timeline(runs_summary)

## ---- plot_zones, fig.width = 7, fig.height = 5--------------------------
run_zones <- zones(runs[1:4], what = "speed", breaks = c(0, 2:6, 12.5))
plot(run_zones)

## ---- plot_Wprime, fig.width = 7, fig.height = 5-------------------------
wexp <- Wprime(runs, session = 11, quantity = "expended", cp = 4, version = "2012")
plot(wexp, scaled = TRUE)

## ---- distProfile, fig.width = 7, fig.height = 5-------------------------
d_profile <- distribution_profile(runs, session = 1:4, what = "speed",
                                  grid = list(speed = seq(0, 12.5, by = 0.05)))
plot(d_profile, multiple = TRUE)

## ---- conProfile, fig.width = 7, fig.height = 5--------------------------
c_profile <- concentrationProfile(d_profile, what = "speed")
plot(c_profile, multiple = TRUE, smooth = TRUE)

## ---- prep_profiles, fig.width = 7, fig.height = 5-----------------------
runsT <- threshold(runs)
dp_runs <- distribution_profile(runsT, what = "speed")
dp_runs_S <- smoother(dp_runs)
cp_runs <- concentration_profile(dp_runs_S)
plot(cp_runs, multiple = TRUE, smooth = FALSE)

## ---- funPCA-------------------------------------------------------------
cpPCA <- funPCA(cp_runs, what = "speed", nharm = 4)

## ---- plot_fPCA, fig.width = 7, fig.height = 7---------------------------
round(cpPCA$varprop, 2)
plot(cpPCA, harm = 1:2)

## ---- plot_scores, fig.show = 'hold', fig.width = 7, fig.height = 5------
## plot scores vs summary statistics
scoresSP <- data.frame(cpPCA$scores)
names(scoresSP) <- paste0("speed_pc", 1:4)
d <- cbind(runs_summary, scoresSP)

library("ggplot2")
## pc1 ~ session duration (moving)
ggplot(d) + geom_point(aes(x = as.numeric(durationMoving), y = speed_pc1)) + theme_bw()
## pc2 ~ avg speed (moving)
ggplot(d) + geom_point(aes(x = avgSpeedMoving, y = speed_pc2)) + theme_bw()

