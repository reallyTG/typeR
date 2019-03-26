## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = FALSE,
  comment = "#>",
  dev="png",
  global.par = TRUE
)
library("knitr")
library("plotrix")
library("trajr")


## ---- eval=FALSE---------------------------------------------------------
#  install.packages("trajr")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("JimMcL/trajr")

## ----eval=FALSE----------------------------------------------------------
#  library("trajr")

## ----randomWalk, echo=FALSE, fig.height=4, fig.width=6, fig.cap="_A correlated random walk with 5 steps. The direction of step $i$ is the direction of step $(i - 1) + \\Delta$~i~._"----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
# Generate and plot a short random trajectory
set.seed(4)
trj <- TrajGenerate(5, random = TRUE)
plot(trj, turning.angles = "random")

## ----directedWalk, echo=FALSE, fig.height=4, fig.width=6, fig.cap="_A directed walk with 5 steps. The direction of step $i$ is the compass direction (here 0$^\\circ$) + $\\Delta$~i~._"----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
# Generate and plot a short directed trajectory
set.seed(1)
trj <- TrajGenerate(5, random = FALSE)
plot(trj, turning.angles = "directed")

## ----creation, fig.width=6, fig.height=4, fig.cap="_Trajectory created from coordinates._", echo=-1----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
# Define x, y, and time coordinates
coords <- data.frame(x = c(1, 1.5, 2, 2.5, 3, 4), 
                     y = c(0, 0, 1, 1, 2, 1), 
                     times = c(0, 1, 2, 3, 4, 5))
# Create a trajectory from the coordinates
trj <- TrajFromCoords(coords)

# Plot it
plot(trj)

## ---- eval=FALSE---------------------------------------------------------
#  coords <- read.csv("mycoords.csv")
#  trj <- TrajFromCoords(coords)

## ---- eval=FALSE---------------------------------------------------------
#  # Example 1
#  coords <- read.csv("H. pahangensis.csv")
#  trj <- TrajFromCoords(coords, spatialUnits = "pixels")
#  # A 10 mm (= .01 m) object had length 47 pixels in the video, scale to metres
#  trj <- TrajScale(trj, .01 / 47, "m")
#  
#  # Example 2
#  coords <- read.csv("A. argentifasciata.csv")
#  # In this video, a 20 cm (= .2 m) object had length 1800 pixels, scale to metres
#  trj <- TrajScale(trj, .2 / 1800, "m")

## ----smooth, fig.width=6, fig.height=4, fig.cap="_Effect of smoothing a trajectory._", echo=-1:-2----
set.seed(3)
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
trj <- TrajGenerate(200, random = TRUE, angularErrorSd = .25)

# Plot original trajectory
plot(trj, lwd = 1, lty = 1)

# Create a smoothed trajectory, filter order 3, length 31
smoothed <- TrajSmoothSG(trj, p = 3, n = 31)
# Plot it in slightly transparent red
lines(smoothed, col = "#FF0000A0", lwd = 2)

legend("topright", c("Original", "Smoothed"), lwd = c(1, 2), lty = c(1, 1), col = c("black", "red"), inset = 0.01)

## ----rediscretize, fig.width=6, fig.height=4, fig.cap="_Rediscretization of trajectory with $\\mu_{L} = 2$ to step length $1$._", echo=-1:-2----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
set.seed(2)
trj <- TrajGenerate(10, stepLength = 2)

# Plot original trajectory with dots at trajectory coordinates
plot(trj, lwd = 2)
points(trj, draw.start.pt = FALSE, pch = 16, col = "black")

# Resample to step length 1
resampled <- TrajRediscretize(trj, 1)

# Plot rediscretized trajectory in red
lines(resampled, col = "#FF0000A0", lwd = 2)
points(resampled, type = 'p', col = "#FF0000A0", pch = 16)
legend("topright", c("Original", "Rediscretized"), col = c("black", "red"), 
       lwd = 2, inset = c(0.01, 0.02))

## ----echo=FALSE, results='asis', fig.align='left'------------------------
kable(data.frame(`Function` = c("`TrajRotate`", "`TrajTranslate`", "`TrajReverse`",
                                "`TrajGetFPS`", "`TrajGetNCoords`", "`TrajGetUnits`",
                                "`TrajGetTimeUnits`", "`TrajStepLengths`", 
                                "`TrajLength`", "`TrajDistance`", 
                                "`TrajDuration`", "`TrajMeanVelocity`", "`TrajAngles`",
                                "`TrajMeanVectorOfTurningAngles`",
                                "`TrajExpectedSquareDisplacement`"), 
                 Description = c("Rotates a trajectory",
                                 "Translates a trajectory",
                                 "Reverses a trajectory",
                                 "Returns the frames-per-second of a trajectory",
                                 "Returns the number of coordinates of a trajectory",
                                 "Returns the spatial units of a trajectory",
                                 "Returns the temporal units of a trajectory",
                                 "Returns the lengths of each step within the trajectory",
                                 "Returns the total length of the trajectory (or a portion)",
                                 "Returns the straight-line distance from the start to the end of the trajectory (or a portion)",
                                 "Returns the temporal duration of the trajectory (or a portion)",
                                 "Returns the mean velocity vector of the trajectory (or a portion)",
                                 "Returns the turning angles (radians) of a trajectory",
                                 "Returns the mean vector of the turning angles",
                                 "Returns the expected square displacement of a correlated random walk")))


## ----speed, fig.cap="_Speed and acceleration over time._", fig.width=6, fig.height=4, echo=-1:-2----
set.seed(1)
par(mar = c(4, 4.5, 1, 4.5) + 0.1)
trj <- TrajGenerate()

# Smooth before calculating derivatives
smoothed <- TrajSmoothSG(trj, 3, 101)

# Calculate speed and acceleration
derivs <- TrajDerivatives(smoothed)

# Plot acceleration and speed
plot(derivs$acceleration ~ derivs$accelerationTimes, type = 'l', col = 'red', 
     yaxt = 'n',
     xlab = 'Time (s)',
     ylab = expression(paste('Acceleration (', m/s^2, ')')))
axis(side = 2, col = "red")
lines(derivs$speed ~ derivs$speedTimes, col = 'blue')
axis(side = 4, col = "blue")
mtext('Speed (m/s)', side = 4, line = 3)
abline(h = 0, col = 'lightGrey')

## ----speedIntervals, fig.cap="_Speed over time, hovering intervals (speed < 2 m/s) highlighted._", fig.width=6, fig.height=4, echo=-1:-2----
set.seed(1)
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
# Simulate a flying bee
trj <- TrajGenerate(100, angularErrorSd = 0.3, stepLength = 0.001)
# Smooth the trajectory
trj <- TrajSmoothSG(trj, 3, 51)

# Calculate hovering intervals
intervals <- TrajSpeedIntervals(trj, slowerThan = 2)
print(intervals)

# Plot speed over time with hovering intervals highlighted
plot(intervals)

## ----traj_prep, echo=-1--------------------------------------------------
set.seed(1)
# Generate some trajectories for use in examples
n <- 100
# Random magnitude of angular errors
angularErrorSd <- runif(n, 0, 2)

# Generate some trajectories with varying angular errors
trjs <- lapply(1:n, function(i) TrajGenerate(500, stepLength = 2, 
                                             angularErrorSd = angularErrorSd[i]))

# Rediscretize each trajectory to a range of step sizes
stepSizes <- c(1, 2, 10)
reds <- lapply(stepSizes, function(ss) lapply(1:n, function(i) TrajRediscretize(trjs[[i]], ss)))

## ----straightness, fig.cap="_Two straightness indices (r, dots, and D/L, crosses) as a function of $\\sigma_{\\Delta}$, plotted for several different step sizes (linear axes)._", fig.height=4, fig.width=6, echo=-1----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)

# Calculate straightness (D/L) for all of the rediscretized trajectories
ds <- sapply(reds, function(trjs) sapply(1:n, function(i) TrajStraightness(trjs[[i]])))
# Calculate alternate straightness (r) for all of the rediscretized trajectories
rs <- sapply(reds, function(trjs) sapply(1:n, function(i) Mod(TrajMeanVectorOfTurningAngles(trjs[[i]]))))

# Plot both indices on the same graph
plot(rep(angularErrorSd, 3), rs,
     pch = 16, cex = .8,
     col = c(rep('red', n), rep('blue', n), rep('darkgreen', n)),
     xlab = expression(sigma[Delta]), ylab = "Straightness",
     ylim = range(c(ds, rs)))
points(rep(angularErrorSd, 3), ds,
     pch = 3, cex = .8,
     col = c(rep('red', n), rep('blue', n), rep('darkgreen', n)))

legend("bottomleft", c(expression(italic(r)), "D/L", paste("Step length", stepSizes)), 
       pch = c(16, 3, 16, 16), 
       col = c("black", "black", "red", "blue", "darkgreen"), inset = 0.01)

## ----Sinuosity, fig.cap="_Sinuosity as a function of $\\sigma_{\\Delta}$, plotted for several different step sizes (linear axes)._", fig.height=4, fig.width=6, echo=-1----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)

# Calculate sinuosity for all of the rediscretized trajectories
sins <- sapply(reds, function(trjs) sapply(1:n, function(i) TrajSinuosity2(trjs[[i]])))

# Plot sinuosity vs angular error
plot(rep(angularErrorSd, 3), sins,
     pch = 16, cex = .8,
     col = c(rep('red', n), rep('blue', n), rep('darkgreen', n)),
     xlab = expression(sigma["angular error"]), ylab = "Sinuosity")

legend("bottomright", paste("Step length", stepSizes), 
       pch = 16, col = c("red", "blue", "darkgreen"), inset = 0.01)

## ----emax, fig.cap="_E~max~ as a function of $\\sigma_{\\Delta}$ (logarithmic axes)._", fig.height=4, fig.width=6, echo=-1----
par(mar = c(4, 4, 1.5, 0.5) + 0.1)
# Calculate Emax for all of the rediscretized trajectories (from the previous example)
emaxs <- sapply(reds, function(trjs) sapply(1:n, function(i) TrajEmax(trjs[[i]])))
emaxs[emaxs < 0] <- NA # Avoid warnings when plotting on log axes

# Plot Emax vs angular error on log axes
plot(rep(angularErrorSd, 3), emaxs,
     log = 'xy',
     pch = 16, cex = .8, 
     col = c(rep('red', n), rep('blue', n), rep('darkgreen', n)),
     xlab = expression(sigma["angular error"]), ylab = expression(E[max]))

legend("bottomleft", c("Step length 1", "Step length 2", "Step length 10"), 
       pch = 16, col = c("red", "blue", "darkgreen"), inset = 0.01)

## ----fractal, fig.cap="_Fractal dimension as a function of $\\sigma_{\\Delta}$._", fig.width=6, fig.height=4, echo=-1----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
# Use the same range of step sizes for all trajectories
stepSizes <- TrajLogSequence(.1, 7, 10)

# Fractal dimension is a slow calculation, so just plot a subset 
# of trajectories from the previous example
fn <- n / 4
use <- sample.int(fn, n = length(angularErrorSd))
fangularErrorSd <- angularErrorSd[use]

# Calculate fractal dimension for all of the rediscretized trajectories
d <- sapply(reds, function(trjs) sapply(use, function(i) {
  TrajFractalDimension(trjs[[i]], stepSizes)
}))

# Plot fractal dimension vs angular error
plot(rep(fangularErrorSd, 3), d,
     pch = 16, cex = .8, 
     col = c(rep('red', fn), rep('blue', fn), rep('darkgreen', fn)),
     xlab = expression(sigma["angular error"]), ylab = expression(E[max]))

legend("topleft", c("Step length 1", "Step length 2", "Step length 10"), 
       pch = 16, col = c("red", "blue", "darkgreen"), inset = 0.01)

## ----DC, fig.cap="_DC and SDDC as a function of $\\sigma_{\\Delta}$._", fig.height=4, fig.width=6, echo=-1----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
# Calculate DC and SDDC for all of the original trajectories (from above)
dcs <- sapply(1:n, function(i) mean(TrajDirectionalChange(trjs[[i]])))
sddcs <- sapply(1:n, function(i) sd(TrajDirectionalChange(trjs[[i]])))

# Plot DC vs angular error
plot(angularErrorSd, dcs,
     pch = 16, cex = .8, col = "blue",
     xlab = expression(sigma["angular error"]), ylab = "DC")
points(angularErrorSd, sddcs, pch = 16, cex = .8, col = 'red')
legend("bottomright", c("DC", "SDDC"), 
       pch = 16, col = c("blue", "red"), inset = 0.01)

## ----dirnAuto, fig.cap="_Direction autocorrelation of a random trajectory with first local minimum._", fig.width=6, fig.height=4, echo=c(-1,-2)----
set.seed(1)
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
trj <- TrajGenerate(1000)
corr <- TrajDirectionAutocorrelations(trj)
plot(corr)

## ----multBuild-----------------------------------------------------------
tracks <- as.data.frame(rbind(
  c("3527.csv", "Zodariid2 sp1",     "spider",       "red"),
  c("3530.csv", "Daerlac nigricans", "mimic bug",    "blue"),
  c("3534.csv", "Daerlac nigricans", "mimic bug",    "blue"),
  c("3537.csv", "M. erythrocephala", "mimic spider", "blue"),
  c("3542.csv", "Polyrhachis sp1",   "ant",          "black"),
  c("3543.csv", "Polyrhachis sp1",   "ant",          "black"),
  c("3548.csv", "Crematogaster sp1", "ant",          "black")
), stringsAsFactors = FALSE)
colnames(tracks) <- c("filename", "species", "category", "col")
# If your list is read from a CSV file which contains empty lines, 
# remove them like this:
tracks <- na.omit(tracks)
# Order of columns in the CSV files is unknown so identify them by name
csvStruct <- list(x = "x", y = "y", time = "Time")
trjs <- TrajsBuild(tracks$filename, scale = .220 / 720, 
                   spatialUnits = "m", timeUnits = "s", 
                   csvStruct = csvStruct, rootDir = "..")

## ----multstats-----------------------------------------------------------
# Define a function which calculates some statistics
# of interest for a single trajectory
characteriseTrajectory <- function(trj) {
  # Measures of speed
  derivs <- TrajDerivatives(trj)
  mean_speed <- mean(derivs$speed)
  sd_speed <- sd(derivs$speed)

  # Measures of straightness
  sinuosity <- TrajSinuosity(trj)
  resampled <- TrajRediscretize(trj, .001)
  Emax <- TrajEmax(resampled)

  # Periodicity
  corr <- TrajDirectionAutocorrelations(resampled, 60)
  first_min <- TrajDAFindFirstMinimum(corr)

  # Return a list with all of the statistics for this trajectory
  list(mean_speed = mean_speed,
       sd_speed = sd_speed,
       sinuosity = sinuosity,
       Emax = Emax,
       min_deltaS = first_min[1],
       min_C = first_min[2]
  )
}

# Calculate all stats for trajectories in the list
# which was built in the previous example
stats <- TrajsMergeStats(trjs, characteriseTrajectory)
print(stats)

## ----pca, fig.cap="_PCA of trajectory characterisations._", fig.width=6, fig.height=4, echo=-1----
par(mar = c(4, 4, 0.5, 0.5) + 0.1)
#---
# Custom PCA plotting function
customPcaPlot <- function(x, xlabs, xcols, choices = 1L:2L, ycol = "#ff2222aa", ...) {
  # Draw points
  pts <- t(t(x$x[, choices]))
  plot(pts, type = "p", 
       xlim = extendrange(pts[, 1L]), ylim = extendrange(pts[, 2L]), 
       asp = 1,
       xlab = "PC1", ylab = "PC2", pch = 16, col = xcols, ...)
  text(pts, labels = xlabs, pos = 1, ...)
  
  # Draw arrows
  axs <- t(t(x$rotation[, choices])) * 3.5
  text(axs, labels = dimnames(axs)[[1L]], col = ycol, ...)
  arrows(0, 0, axs[, 1L] * .8, axs[, 2L] * .8, length = .1, col = ycol)
}
# ---

# Here we are operating on the statistics from the previous example

# Get rid of NAs in stats because prcomp can't handle them.
# First fix min_deltaS, and add an extra column which flags non-periodic trajectories
pcaStats <- TrajsStatsReplaceNAs(stats, "min_deltaS", 
                                 replacementValue = 2 * max(stats$min_deltaS, na.rm = TRUE),
                                 flagColumn = "no_first_min")
# Also get rid of NAs in min_C - no need to add another column since it would duplicate no_first_min
pcaStats <- TrajsStatsReplaceNAs(pcaStats, "min_C",
                                 replacementValue = 2 * max(stats$min_C, na.rm = TRUE))
# Perform the PCA
PCA <- prcomp(pcaStats, scale. = TRUE)
# Plot it using custom plotting function. Could just call biplot instead
customPcaPlot(PCA, tracks$category, tracks$col, cex = .8)
legend("bottomleft", c("Spider", "Mimic", "Ant"), pch = 16, 
       col = c('red', 'blue', 'black'), inset = c(0.01, .02))

## ------------------------------------------------------------------------
summary(TrajsStepLengths(trjs))

## ----generate, fig.width=6, fig.height=4, fig.cap="_Some generated trajectories. a) correlated walk, b) directed walk, c) brownian motion, d) Levy walk._", echo=-1:-2----
set.seed(1)
par(mfrow = c(2, 2), mar = c(4, 4, 0.5, 0.5) + 0.1)
# Correlated random walk
trj <- TrajGenerate(n = 200)
# Plot it
plot(trj)
mtext("a)", 3, -1.3, adj = .05)

# Directed walk
trj <- TrajGenerate(n = 20, random = FALSE)
plot(trj)
mtext("b)", 3, -1.3, adj = .05)

# Brownian motion
trj <- TrajGenerate(n = 500, angularErrorDist = function(n) stats::runif(n, -pi, pi))
plot(trj)
mtext("c)", 3, -1.3, adj = .05)

# Levy walk - path lengths follow a cauchy distribution
trj <- TrajGenerate(linearErrorDist = stats::rcauchy)
plot(trj)
mtext("d)", 3, -1.3, adj = .05)

