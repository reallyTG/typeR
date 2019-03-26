library(simEd)


### Name: igamma
### Title: Random Variate Generation for the Gamma Distribution
### Aliases: igamma
### Keywords: hplot,dynamic,distribution

### ** Examples

igamma(0.7, 3, 2)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PDF plots
set.seed(8675309)
igamma(runif(10), 3, 2, showPDF = TRUE)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
set.seed(8675309)
igamma(runif(10), 3, 2, showECDF = TRUE)

par(mfrow = c(3,1)) # 3 rows, 1 col for CDF, PDF, and ECDF plots
set.seed(8675309)
igamma(runif(10), 3, 2, showPDF = TRUE, showECDF = TRUE)

par(mfrow = c(1,1)) # 1 row, 1 col for PDF only plot
set.seed(8675309)
igamma(runif(10), 3, 2, showPDF = TRUE, showCDF = FALSE)

par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PDF plots
igamma(runif(120), 3, 2, showPDF = TRUE, minPlotQuantile = 0.02, maxPlotQuantile = 0.98)

# overlay visual exploration of ks.test results
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
set.seed(54321)
vals <- igamma(runif(10), 3, 2, showECDF = TRUE)
D <- as.numeric(ks.test(vals, "pgamma", 3, 2)$statistic)
for (x in seq(1.0, 2.0, by = 0.05)) {
   y <- pgamma(x, 3, 2)
   segments(x, y, x, y + D, col = "darkgreen", lwd = 2, xpd = NA)
}

# plot the PDF and CDF without any variates
par(mfrow = c(2,1)) # 2 rows, 1 col for PDF and CDF plots
igamma(NULL, 3, 2)

# plot CDF with inversion and PDF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and PDF plots
igamma(runif(10), 3, 2, show = c(1,1,0))
igamma(runif(10), 3, 2, show = 6)

# plot CDF with inversion and ECDF using show
par(mfrow = c(2,1)) # 2 rows, 1 col for CDF and ECDF plots
igamma(runif(10), 3, 2, show = c(1,0,1))
igamma(runif(10), 3, 2, show = 5)

# plot CDF with inversion, PDF, and ECDF using show
par(mfrow = c(3,1)) # 3 rows, 1 col for CDF, PDF, and ECDF plots
igamma(runif(10), 3, 2, show = c(1,1,1))
igamma(runif(10), 3, 2, show = 7)

# plot three different CDF+PDF+ECDF vertical displays
par(mfcol = c(3,3))  # 3 rows, 3 cols, filling columns before rows
set.seed(8675309)
igamma(runif(20), 3, 2, show = 7)
igamma(runif(20), 3, 2, show = 7)
igamma(runif(20), 3, 2, show = 7)

# plot three different CDF+PDF+ECDF horizontal displays, with title only
# on the first display
par(mfrow = c(3,3))  # 3 rows, 3 cols, filling rows before columns
set.seed(8675309)
igamma(runif(20), 3, 2, show = 7)
igamma(runif(20), 3, 2, show = 7, showTitle = FALSE)
igamma(runif(20), 3, 2, show = 7, showTitle = FALSE)

# exhibit use of the respectLayout = FALSE option
par(mfrow = c(3,3))  # this will be ignored below since respectLayout = FALSE
set.seed(8675309)
igamma(runif(20), 3, 2, show = 7, respectLayout = FALSE)
par("mfrow")  # will have been reset c(1,1)
par("mar")    # will have been reset to c(5.1, 4.1, 4.1, 2.1)




