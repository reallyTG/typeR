library(WaveletComp)


### Name: wt.phase.image
### Title: Image plot of the phases of periodic components for a single
###   time series
### Aliases: wt.phase.image
### Keywords: ts

### ** Examples
 
## Not run: 
##D ## The following example is adopted from Liu et al., 2007:
##D 
##D series.length <- 6*128*24
##D x1 <- periodic.series(start.period = 1*24, length = series.length)
##D x2 <- periodic.series(start.period = 8*24, length = series.length)
##D x3 <- periodic.series(start.period = 32*24, length = series.length)
##D x4 <- periodic.series(start.period = 128*24, length = series.length)
##D 
##D x <- x1 + x2 + x3 + x4
##D 
##D plot(x, type = "l", xlab = "index", ylab = "", xaxs = "i",
##D      main = "hourly series with periods of 1, 8, 32, 128 days")
##D 
##D my.date <- seq(as.POSIXct("2014-10-14 00:00:00", format = "%F %T"), 
##D                by = "hour", 
##D                length.out = series.length)     
##D my.data <- data.frame(date = my.date, x = x)  
##D 
##D ## Computation of wavelet power:
##D ## a natural choice of 'dt' in the case of hourly data is 'dt = 1/24', 
##D ## resulting in one time unit equaling one day.
##D ## This is also the time unit in which periods are measured.
##D my.wt <- analyze.wavelet(my.data, "x", 
##D                         loess.span = 0, 
##D                         dt = 1/24, dj = 1/20, 
##D                         lowerPeriod = 1/4, 
##D                         make.pval = TRUE, n.sim = 10)
##D 
##D ## Plot of wavelet power spectrum with equidistant color breakpoints:  
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"),
##D    periodlab = "period (days)")
##D 
##D ## Default image of phases:
##D wt.phase.image(my.wt, 
##D    main = "image of phases", 
##D    periodlab = "period (days)")
##D 
##D ## With time elapsed in days 
##D ## (starting from 0 and proceeding in steps of 50 days) 
##D ## instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24
##D wt.phase.image(my.wt, 
##D    main = "image of phases", 
##D    periodlab = "period (days)",
##D    timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D 
##D ## The same plot, but with (automatically produced) calendar axis:
##D wt.phase.image(my.wt, 
##D    main = "image of phases", periodlab = "period (days)", 
##D    show.date = TRUE, date.format = "%F %T")
##D 
##D ## For further axis plotting options:
##D ## Please see the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.    
##D 
##D ## Image plot of phases with numerals as labels of the color legend bar: 
##D wt.phase.image(my.wt, 
##D    legend.params=list(pi.style = FALSE, label.digits = 2))
##D    
## End(Not run)



