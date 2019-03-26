library(simEd)


### Name: igeom
### Title: Random Variate Generation for the Geometric Distribution
### Aliases: igeom
### Keywords: hplot,dynamic,distribution

### ** Examples

igeom(0.7, 0.4)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PMF plots
set.seed(8675309)
igeom(runif(10), 0.4, showPMF = TRUE)

par(mfrow = c(1,1)) # 1 row, 1 col for PMF only plot
set.seed(8675309)
igeom(runif(10), 0.4, showPMF = TRUE, showCDF = FALSE)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PMF plots
igeom(runif(120), 0.4, showPMF = TRUE, minPlotQuantile = 0.02, maxPlotQuantile = 0.98)

# plot the PMF and CDF without any variates
par(mfrow = c(2,1)) # 2 rows, 1 col for PMF and CDF plots
igeom(NULL, 0.4)

# plot CDF with inversion and PMF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PMF plots
igeom(runif(10), 0.4, show = c(1,1,0))
igeom(runif(10), 0.4, show = 6)

# plot CDF with inversion and ECDF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
igeom(runif(10), 0.4, show = c(1,0,1))
igeom(runif(10), 0.4, show = 5)

# plot CDF with inversion, PMF, and ECDF using show
par(mfrow = c(3,1)) # 3 rows, 1 col for CDF, PMF, and ECDF plots
igeom(runif(10), 0.4, show = c(1,1,1))
igeom(runif(10), 0.4, show = 7)

# plot three different CDF+PMF+ECDF vertical displays
par(mfcol = c(3,3))  # 3 rows, 3 cols, filling columns before rows
set.seed(8675309)
igeom(runif(20), prob = 0.4, show = 7)
igeom(runif(20), prob = 0.4, show = 7)
igeom(runif(20), prob = 0.4, show = 7)

# plot three different CDF+PMF+ECDF horizontal displays, with title only
# on the first display
par(mfrow = c(3,3))  # 3 rows, 3 cols, filling rows before columns
set.seed(8675309)
igeom(runif(20), prob = 0.4, show = 7)
igeom(runif(20), prob = 0.4, show = 7, showTitle = FALSE)
igeom(runif(20), prob = 0.4, show = 7, showTitle = FALSE)

# exhibit use of the respectLayout = FALSE option
par(mfrow = c(3,3))  # this will be ignored below since respectLayout = FALSE
set.seed(8675309)
igeom(runif(20), prob = 0.4, show = 7, respectLayout = FALSE)
par("mfrow")  # will have been reset c(1,1)
par("mar")    # will have been reset to c(5.1, 4.1, 4.1, 2.1)




