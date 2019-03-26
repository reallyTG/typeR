## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(fig.width=5, fig.height = 4)

## ----load----------------------------------------------------------------
require(moveWindSpeed)
data("storks")
plot(
  storks,
  xlab = "Longitude",
  ylab = "Latitude",
  main = "Stork data" ,
  pch = 19,
  cex = .3
)

## ----subset--------------------------------------------------------------
storksSub <-
  storks[strftime(timestamps(storks), format = "%H%M", tz="UTC") %in% c("1303", "1304"), ]
storksWind <- getWindEstimates(storksSub)
storksWind <- spTransform(storksWind, center = T)
indiv1 <- storksWind[[1]]
indiv1

## ----freq----------------------------------------------------------------
unique(as.numeric(diff(timestamps(indiv1)), units='secs'))

## ----plotExample---------------------------------------------------------
plot(
  indiv1,
  type = 'l',
  xlim = c(-150, 150),
  main = row.names(idData(indiv1))
)
s <- as.numeric(timestamps(indiv1)) %% 10 == 0
expansion <- 3
arrows(
  coordinates(indiv1)[s, 1],
  coordinates(indiv1)[s, 2],
  coordinates(indiv1)[s, 1] + indiv1$windX[s] * expansion,
  coordinates(indiv1)[s, 2] + indiv1$windY[s] * expansion,
  col = 'red',
  length = .1
)

## ----arrows--------------------------------------------------------------
indivSub <- indiv1[45:72,]
plot(indivSub, pch = 19)
arrows(
  coordinates(indivSub)[-n.locs(indivSub), 1],
  coordinates(indivSub)[-n.locs(indivSub), 2],
  coordinates(indivSub)[-1, 1],
  coordinates(indivSub)[-1, 2],
  length = .1
)
arrows(
  coordinates(indivSub)[-n.locs(indivSub), 1],
  coordinates(indivSub)[-n.locs(indivSub), 2],
  coordinates(indivSub)[-n.locs(indivSub), 1] + head(indivSub$windX,-1),
  coordinates(indivSub)[-n.locs(indivSub), 2] + head(indivSub$windY,-1),
  col = "red",
  length = .1
)
arrows(
  coordinates(indivSub)[-n.locs(indivSub), 1] + head(indivSub$windX,-1),
  coordinates(indivSub)[-n.locs(indivSub), 2] + head(indivSub$windY,-1),
  coordinates(indivSub)[-1, 1],
  coordinates(indivSub)[-1, 2],
  col = "green",
  length = .1
)
legend(
  "topright",
  legend = c("Ground speed", "Wind Speed", "Air Speed"),
  bty = "n",
  col = c("black", "red", "green"),
  lty = 1
)

## ----airVector-----------------------------------------------------------
s <- !is.na(indiv1$windX)
x <- cumsum(diff(coordinates(indiv1)[, 1])[s] - indiv1$windX[s])
y <- cumsum(diff(coordinates(indiv1)[, 2])[s] - indiv1$windY[s])
plot(x, y, type = 'l', main = "Wind corrected trajectory")

## ----group---------------------------------------------------------------
storksSub <- getWindEstimates(storksSub, windowSize = 31)
plot(
  storksSub$windX,
  storksSub$windY,
  col = trackId(storksSub),
  pch = 19,
  xlim = range(na.omit(c(0, storksSub$windX))),
  ylim = range(na.omit(c(0, storksSub$windY))),
  asp = 1,
  main = "Distribution of wind speed estimates"
)

## ----verticalProfile-----------------------------------------------------
windData <- getWindEstimates(storks)
windData <- windData[strftime(timestamps(windData), format = "%H", tz="UTC") == "12" &
                       !is.na(windData$windX), ]
plot(
  sqrt(windData$windX ^ 2 + windData$windY ^ 2),
  windData$height_above_ellipsoid,
  main = "Vertical wind profile",
  xlab = "Wind speed",
  ylab = "Altitude",
  col = trackId(windData),
  pch = 19
)

## ----rotations-----------------------------------------------------------
indivSub <- storks[[1]]
quater <-
  getWindEstimates(indivSub, isThermallingFunction = getDefaultIsThermallingFunction(90))
half <-
  getWindEstimates(indivSub, isThermallingFunction = getDefaultIsThermallingFunction(180))
full <-
  getWindEstimates(indivSub, isThermallingFunction = getDefaultIsThermallingFunction(360))
two <-
  getWindEstimates(indivSub, isThermallingFunction = getDefaultIsThermallingFunction(720))

sum(!is.na(quater$windX))
sum(!is.na(half$windX))
sum(!is.na(full$windX))
sum(!is.na(two$windX))

## ----wl------------------------------------------------------------------
short <-
  getWindEstimates(indivSub,
                   isThermallingFunction = getDefaultIsThermallingFunction(720),
                   windowSize = 29)
long <-
  getWindEstimates(indivSub,
                   isThermallingFunction = getDefaultIsThermallingFunction(720),
                   windowSize = 41)
sum(!is.na(short$windX))
sum(!is.na(long$windX))

## ----speedup-------------------------------------------------------------
system.time(getWindEstimates(
  indivSub,
  isFocalPoint = function(i, ts) {
    T
  }
))
system.time(getWindEstimates(
  indivSub,
  isFocalPoint = function(i, ts) {
    (i %% 5) == 0
  }
))

