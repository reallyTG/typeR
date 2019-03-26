library(WaveletComp)


### Name: wt.image
### Title: Image plot of the wavelet power spectrum of a single time series
### Aliases: wt.image
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
##D ## The following dates refer to the local time zone 
##D ## (possibly allowing for daylight saving time):      
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
##D ## Plot of wavelet power spectrum 
##D ## with color breakpoints referring to quantiles:  
##D wt.image(my.wt, main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (quantiles)", 
##D                         lab.line = 3.5, 
##D                         label.digits = 2),
##D    periodlab = "period (days)")
##D ## Note:
##D ## The default time axis shows an index of given points in time, 
##D ## which is the count of hours in our example.
##D 
##D ## The same plot, but with equidistant color breakpoints: 
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"),
##D    periodlab = "period (days)")
##D          
##D ## Alternative styles of the time axis:          
##D          
##D ## The plot with time elapsed in days, starting from 0 and proceeding 
##D ## in steps of 50 days (50*24 hours),
##D ## instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24
##D ## Insert your specification of the time axis: 
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"),
##D    periodlab = "period (days)", timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D 
##D ## The plot with (automatically produced) calendar axis:
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"), 
##D    periodlab = "period (days)",
##D    show.date = TRUE, date.format = "%F %T")
##D 
##D ## Individualizing your calendar axis (works with 'show.date = TRUE')...
##D ## How to obtain, for example, monthly date ticks and labels:
##D 
##D ## The sequence of tick positions:
##D monthly.ticks <- seq(as.POSIXct("2014-11-01 00:00:00", format = "%F %T"), 
##D                      as.POSIXct("2016-11-01 00:00:00", format = "%F %T"), 
##D                      by = "month")
##D ## Observe that the following specification may produce an error:
##D ## 'seq(as.Date("2014-11-01"), as.Date("2016-11-01"), by = "month")'
##D ## Time of the day is missing here!
##D 
##D ## The sequence of labels (e.g. information on month and year only):
##D monthly.labels <- strftime(monthly.ticks, format = "%b %Y")
##D 
##D ## Insert your specification of the time axis: 
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"), 
##D    periodlab = "period (days)", 
##D    show.date = TRUE, date.format = "%F %T", 
##D    spec.time.axis = list(at = monthly.ticks, labels = monthly.labels, 
##D                          las = 2))
##D ## Note: 
##D ## The monthly ticks specify the midpoints of the colored cells and match 
##D ## the location of corresponding (default) time index ticks.
##D          
##D ## Furthermore, the plot with an individualized period axis:
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"), 
##D    periodlab = "period (days)", 
##D    show.date = TRUE, date.format = "%F %T",
##D    spec.time.axis = list(at = monthly.ticks, labels = monthly.labels, 
##D                          las = 2),
##D    spec.period.axis = list(at = c(1,8,32,128))) 
##D          
##D ## Switching the time axis from index to time elapsed in hours 
##D ## (starting from 0, and proceeding in steps of 500 hours), 
##D ## and the period axis from days to hours:
##D index.ticks  <- seq(1, series.length, by = 500)
##D index.labels <- index.ticks - 1
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant)"), 
##D    timelab = "time elapsed (hours)", periodlab = "period (hours)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels),
##D    spec.period.axis = list(at = c(1,8,32,128), labels = c(1,8,32,128)*24))            
##D 
##D ## A plot with different colors:
##D wt.image(my.wt, main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (quantiles)", 
##D                         lab.line = 3.5, label.digits = 2), 
##D    color.palette = "gray((1:n.levels)/n.levels)", col.ridge = "yellow",
##D    periodlab = "period (days)")
##D 
##D ## In the case of monthly (or quarterly) data, the time axis should be 
##D ## labeled at equally spaced time points. An example:
##D 
##D monthyear <- seq(as.Date("2014-01-01"), as.Date("2018-01-01"),
##D                  by = "month")
##D monthyear <- strftime(monthyear, format = "%b %Y")
##D 
##D xx <- periodic.series(start.period = 6, length = length(monthyear))
##D xx <- xx + 0.2*rnorm(length(monthyear))
##D 
##D plot(xx, type = "l", xlab = "index", ylab = "", xaxs = "i",
##D      main = "monthly series with period of 6 months")
##D 
##D monthly.data <- data.frame(date = monthyear, xx = xx)
##D  
##D my.wt <- analyze.wavelet(monthly.data, "xx", loess.span = 0, 
##D                          dt = 1, dj = 1/250, 
##D                          make.pval = TRUE, n.sim = 250)
##D ## Note: 
##D ## The natural choice of 'dt' in this example is 'dt = 1', 
##D ## resulting in periods measured in months. 
##D ## (Setting 'dt = 1/12' would result in periods measured in years.)
##D 
##D ## The default wavelet power plot then shows the monthly:
##D wt.image(my.wt, main = "wavelet power spectrum", 
##D    periodlab = "period (months)")
##D 
##D ## The following plot shows the elapsed time, measured in months: 
##D wt.image(my.wt, main = "wavelet power spectrum", 
##D    periodlab = "period (months)", timelab = "time elapsed (months)",
##D    spec.time.axis = list(at = 1:length(monthyear), 
##D                          labels = (1:length(monthyear))-1))
##D                                      
##D ## In case you prefer the monthyear labels themselves: 
##D wt.image(my.wt,  main = "wavelet power spectrum", 
##D    periodlab = "period (months)", timelab = "month and year",
##D    spec.time.axis = list(at = 1:length(monthyear), labels = monthyear)) 
##D 
##D ## You may sometimes wish to enhance your plot with additional information. 
##D ## There is an option to add further objects to the image plot region, 
##D ## by setting 'graphics.reset = FALSE' 
##D ## (but recall previous par settings after plotting):
##D 
##D op <- par(no.readonly = TRUE)
##D wt.image(my.wt, main = "wavelet power spectrum", 
##D    periodlab = "period (months)", 
##D    spec.period.axis = list(at = c(2,4,6,8,12)), 
##D    spec.time.axis = list(at = 1:length(monthyear),
##D                          labels = substr(monthyear,1,3)),
##D    graphics.reset = FALSE)
##D abline(h = log2(6), lty = 3)         
##D abline(v = seq(1, length(monthyear), by = 12), lty = 3)
##D mtext(2014:2018, side = 1, 
##D       at = seq(1, length(monthyear), by = 12), line = 2)
##D par(op)
##D 
##D ## For further axis plotting options:
##D ## Please see the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.
##D 
## End(Not run)



