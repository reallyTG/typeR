library(Rssa)


### Name: Rssa-package
### Title: A collection of methods for singular spectrum analysis
### Aliases: Rssa-package Rssa
### Keywords: package

### ** Examples

s <- ssa(co2) # Perform the decomposition using the default window length
summary(s)        # Show various information about the decomposition
plot(s)           # Show the plot of the eigenvalues
r <- reconstruct(s, groups = list(Trend = c(1, 4),
                                  Seasonality = c(2:3, 5:6))) # Reconstruct into 2 series
plot(r, add.original = TRUE)  # Plot the reconstruction

# Simultaneous trend extraction using MSSA
## No test: 
s <- ssa(EuStockMarkets, kind = "mssa")
r <- reconstruct(s, groups = list(Trend = c(1,2)))
plot(r, plot.method = "xyplot", add.residuals = FALSE,
     superpose = TRUE, auto.key = list(columns = 2))
# Trend forecast
f <- rforecast(s, groups = list(Trend = c(1, 2)),
               len = 50, only.new = FALSE)
library(lattice)
xyplot(ts.union(Original = EuStockMarkets, "Recurrent Forecast" = f),
       superpose = TRUE, auto.key = list(columns = 2))
## End(No test)



