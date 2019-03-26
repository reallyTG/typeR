library(simEd)


### Name: ibinom
### Title: Random Variate Generation for the Binomial Distribution
### Aliases: ibinom
### Keywords: hplot,dynamic,distribution

### ** Examples

ibinom(0.7, 7, 0.4)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PMF plots
set.seed(8675309)
ibinom(runif(10), 7, 0.4, showPMF = TRUE)

par(mfrow = c(1,1)) # 1 row, 1 col for PMF only plot
set.seed(8675309)
ibinom(runif(10), 7, 0.4, showPMF = TRUE, showCDF = FALSE)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PMF plots
ibinom(runif(120), 200, 0.5, showPMF = TRUE, minPlotQuantile = 0.02, maxPlotQuantile = 0.98)

# overlay visual exploration of ks.test results
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
set.seed(54321)
vals <- ibinom(runif(10), 10, 0.3, showECDF = TRUE)
D <- as.numeric(ks.test(vals, "pbinom", 10, 0.3)$statistic)
x <- 2.5
y <- pbinom(x, 10, 0.3)
segments(x, y, x, y + D, col = "darkgreen", lwd = 3)

# plot the PMF and CDF without any variates
par(mfrow = c(2,1)) # 2 rows, 1 col for PMF and CDF plots
ibinom(NULL, 10, 0.3)

# plot CDF with inversion and PMF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PMF plots
ibinom(runif(10), 10, 0.3, show = c(1,1,0))
ibinom(runif(10), 10, 0.3, show = 6)

# plot CDF with inversion and ECDF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
ibinom(runif(10), 10, 0.3, show = c(1,0,1))
ibinom(runif(10), 10, 0.3, show = 5)

# plot CDF with inversion, PMF, and ECDF using show
par(mfrow = c(3,1)) # 3 rows, 1 col for CDF, PMF, and ECDF plots
ibinom(runif(10), 10, 0.3, show = c(1,1,1))
ibinom(runif(10), 10, 0.3, show = 7)

# plot three different CDF+PMF+ECDF vertical displays
par(mfcol = c(3,3))  # 3 rows, 3 cols, filling columns before rows
set.seed(8675309)
ibinom(runif(20), size = 10, prob = 0.3, show = 7)
ibinom(runif(20), size = 10, prob = 0.3, show = 7)
ibinom(runif(20), size = 10, prob = 0.3, show = 7)

# plot three different CDF+PMF+ECDF horizontal displays, with title only
# on the first display
par(mfrow = c(3,3))  # 3 rows, 3 cols, filling rows before columns
set.seed(8675309)
ibinom(runif(20), size = 10, prob = 0.3, show = 7)
ibinom(runif(20), size = 10, prob = 0.3, show = 7, showTitle = FALSE)
ibinom(runif(20), size = 10, prob = 0.3, show = 7, showTitle = FALSE)

# exhibit use of the respectLayout = FALSE option
par(mfrow = c(3,3))  # this will be ignored below since respectLayout = FALSE
set.seed(8675309)
ibinom(runif(20), size = 10, prob = 0.3, show = 7, respectLayout = FALSE)
par("mfrow")  # will have been reset c(1,1)
par("mar")    # will have been reset to c(5.1, 4.1, 4.1, 2.1)




