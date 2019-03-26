library(WaveletComp)


### Name: wc.sel.phases
### Title: Comparison plot of phases for selected periodic components of
###   two time series
### Aliases: wc.sel.phases
### Keywords: ts

### ** Examples

## Not run: 
##D ## The following example is modified from Veleda et al., 2012:
##D 
##D series.length <- 3*128*24
##D x1 <- periodic.series(start.period = 1*24, length = series.length)
##D x2 <- periodic.series(start.period = 2*24, length = series.length)
##D x3a <- periodic.series(start.period = 4*24, length = series.length)
##D x3b <- periodic.series(start.period = 4*24, length = series.length,
##D                        phase = 24)
##D x4 <- periodic.series(start.period = 8*24, length = series.length)
##D x5 <- periodic.series(start.period = 16*24, length = series.length)
##D x6 <- periodic.series(start.period = 32*24, length = series.length)
##D x7 <- periodic.series(start.period = 64*24, length = series.length)
##D x8 <- periodic.series(start.period = 128*24, length = series.length)
##D 
##D x <- x1 + x2 + x3a + x4 + 3*x5 + x6 + x7 + x8 + rnorm(series.length)
##D y <- x1 + x2 + x3b + x4 - 3*x5 + x6 + 3*x7 + x8 + rnorm(series.length)
##D 
##D matplot(data.frame(x, y), type = "l", lty = 1, xaxs = "i", col = 1:2, 
##D  xlab = "index", ylab = "",
##D  main = "hourly series with periods of 1, 2, 4, 8, 16, 32, 64, 128 days", 
##D  sub = "(different phases at periods 4 and 16)")
##D legend("topright", legend = c("x","y"), col = 1:2, lty = 1)
##D 
##D my.date <- seq(as.POSIXct("2014-10-14 00:00:00", format = "%F %T"), 
##D                by = "hour", 
##D                length.out = series.length)     
##D my.data <- data.frame(date = my.date, x = x, y = y)
##D 
##D ## Computation of cross-wavelet power and wavelet coherency of x over y:
##D ## a natural choice of 'dt' in the case of hourly data is 'dt = 1/24', 
##D ## resulting in one time unit equaling one day.
##D ## This is also the time unit in which periods are measured.
##D my.wc <- analyze.coherency(my.data, c("x","y"), loess.span = 0, 
##D                           dt = 1/24, dj = 1/20,
##D                           window.size.t = 1, window.size.s = 1/2, 
##D                           lowerPeriod = 1/4, 
##D                           make.pval = TRUE, n.sim = 10)
##D 
##D ## Plot of cross-wavelet power spectrum, 
##D ## with color breakpoints according to quantiles:
##D wc.image(my.wc, main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels (quantiles)"),
##D    periodlab = "period (days)")
##D 
##D ## Select period 64 and compare plots of corresponding phases, including 
##D ## the phase differences (angles) in their non-smoothed (default) version:
##D wc.sel.phases(my.wc, sel.period = 64, show.Angle = TRUE)
##D 
##D ## With time elapsed in days
##D ## (starting from 0 and proceeding in steps of 50 days) 
##D ## instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24
##D wc.sel.phases(my.wc, sel.period = 64, show.Angle = TRUE,  
##D    timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D 
##D ## The same plot, but with (automatically produced) calendar axis:
##D wc.sel.phases(my.wc, sel.period = 64, show.Angle = TRUE,   
##D    show.date = TRUE, date.format = "%F %T")
##D 
##D ## For further axis plotting options:
##D ## Please see the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.    
##D 
##D ## Now, select period 16...
##D ## and observe that corresponding components are out of phase:
##D wc.sel.phases(my.wc, sel.period = 16, show.Angle = TRUE,
##D    show.date = TRUE, date.format = "%F %T")
##D ## ... compare to period 4...
##D wc.sel.phases(my.wc, sel.period = 4, show.Angle = TRUE,
##D    show.date = TRUE, date.format = "%F %T")   
##D 
##D ## In the following, no periods are selected. 
##D ## In this case, instead of individual phases, the plot shows 
##D ## average phases for each series: 
##D wc.sel.phases(my.wc)
##D 
## End(Not run)



