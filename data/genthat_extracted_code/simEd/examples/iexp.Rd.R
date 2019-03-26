library(simEd)


### Name: iexp
### Title: Random Variate Generation for the Exponential Distribution
### Aliases: iexp
### Keywords: hplot,dynamic,distribution

### ** Examples

iexp(0.7, rate = 2)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PDF plots
set.seed(8675309)
iexp(runif(10), rate = 2, showPDF = TRUE)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
set.seed(8675309)
iexp(runif(10), rate = 2, showECDF = TRUE)

par(mfrow = c(3,1)) # 3 rows, 1 col for CDF, PDF, and ECDF plots
set.seed(8675309)
iexp(runif(10), rate = 2, showPDF = TRUE, showECDF = TRUE)

par(mfrow = c(1,1)) # 1 row, 1 col for PDF only plot
set.seed(8675309)
iexp(runif(10), rate = 2, showPDF = TRUE, showCDF = FALSE)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PDF plots
iexp(runif(120), rate = 2, showPDF = TRUE, minPlotQuantile = 0.02, maxPlotQuantile = 0.98)

# overlay visual exploration of ks.test results
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
set.seed(54321)
vals <- iexp(runif(10), rate = 2, showECDF = TRUE)
D <- as.numeric(ks.test(vals, "pexp", 2)$statistic)
for (x in seq(0.05, 0.75, by = 0.05)) {
   y <- pexp(x, rate = 2)
   segments(x, y, x, y + D, col = "darkgreen", lwd = 2, xpd = NA)
}

# plot the PDF and CDF without any variates
par(mfrow = c(2,1)) # 2 rows, 1 col for PDF and CDF plots
iexp(NULL, rate = 2)

# plot CDF with inversion and PDF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PDF plots
iexp(runif(10), rate = 2, show = c(1,1,0))
iexp(runif(10), rate = 2, show = 6)

# plot CDF with inversion and ECDF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
iexp(runif(10), rate = 2, show = c(1,0,1))
iexp(runif(10), rate = 2, show = 5)

# plot CDF with inversion, PDF, and ECDF using show
par(mfrow = c(3,1)) # 3 rows, 1 col for CDF, PDF, and ECDF plots
iexp(runif(10), rate = 2, show = c(1,1,1))
iexp(runif(10), rate = 2, show = 7)

# plot three different CDF+PDF+ECDF vertical displays
par(mfcol = c(3,3))  # 3 rows, 3 cols, filling columns before rows
set.seed(8675309)
iexp(runif(20), rate = 2, show = 7)
iexp(runif(20), rate = 2, show = 7)
iexp(runif(20), rate = 2, show = 7)

# plot three different CDF+PDF+ECDF horizontal displays, with title only
# on the first display
par(mfrow = c(3,3))  # 3 rows, 3 cols, filling rows before columns
set.seed(8675309)
iexp(runif(20), rate = 2, show = 7)
iexp(runif(20), rate = 2, show = 7, showTitle = FALSE)
iexp(runif(20), rate = 2, show = 7, showTitle = FALSE)

# exhibit use of the respectLayout = FALSE option
par(mfrow = c(3,3))  # this will be ignored below since respectLayout = FALSE
set.seed(8675309)
iexp(runif(20), rate = 2, show = 7, respectLayout = FALSE)
par("mfrow")  # will have been reset c(1,1)
par("mar")    # will have been reset to c(5.1, 4.1, 4.1, 2.1)




