library(WaveletComp)


### Name: wc.image
### Title: Image plot of the cross-wavelet power spectrum and wavelet
###   coherence spectrum of two time series
### Aliases: wc.image
### Keywords: ts

### ** Examples

## Not run: 
##D ## The following example is modified from Veleda et al., 2012:
##D 
##D series.length <- 3*128*24
##D x1 <- periodic.series(start.period = 1*24, length = series.length)
##D x2 <- periodic.series(start.period = 2*24, length = series.length)
##D x3 <- periodic.series(start.period = 4*24, length = series.length)
##D x4 <- periodic.series(start.period = 8*24, length = series.length)
##D x5 <- periodic.series(start.period = 16*24, length = series.length)
##D x6 <- periodic.series(start.period = 32*24, length = series.length)
##D x7 <- periodic.series(start.period = 64*24, length = series.length)
##D x8 <- periodic.series(start.period = 128*24, length = series.length)
##D 
##D x <- x1 + x2 + x3 + x4 + 3*x5 + x6 + x7 + x8 + rnorm(series.length)
##D y <- x1 + x2 + x3 + x4 - 3*x5 + x6 + 3*x7 + x8 + rnorm(series.length)
##D 
##D matplot(data.frame(x, y), type = "l", lty = 1, xaxs = "i", col = 1:2, 
##D  xlab = "index", ylab = "",
##D  main = "hourly series with periods of 1, 2, 4, 8, 16, 32, 64, 128 days", 
##D  sub = "(out of phase at period 16, different amplitudes at period 64)")
##D legend("topright", legend = c("x","y"), col = 1:2, lty = 1)
##D 
##D ## The following dates refer to the local time zone 
##D ## (possibly allowing for daylight saving time):      
##D my.date <- seq(as.POSIXct("2014-10-14 00:00:00", format = "%F %T"), 
##D                by = "hour", 
##D                length.out = series.length)     
##D my.data <- data.frame(date = my.date, x = x, y = y)
##D 
##D ## Computation of cross-wavelet power and wavelet coherence, x over y:
##D ## a natural choice of 'dt' in the case of hourly data is 'dt = 1/24',
##D ## resulting in one time unit equaling one day. 
##D ## This is also the time unit in which periods are measured.
##D my.wc <- analyze.coherency(my.data, c("x","y"), 
##D                            loess.span = 0, 
##D                            dt = 1/24, dj = 1/20, 
##D                            window.size.t = 1, window.size.s = 1/2, 
##D                            lowerPeriod = 1/4,
##D                            make.pval = TRUE, n.sim = 10)
##D 
##D ## Plot of cross-wavelet power spectrum, 
##D ## with color breakpoints according to quantiles:
##D wc.image(my.wc, 
##D    main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels (quantiles)"),
##D    periodlab = "period (days)")
##D ## Note:
##D ## The default time axis shows an index of given points in time, 
##D ## which is the count of hours in our example.      
##D ## By default, arrows are plotted which show the phase differences 
##D ## of x over y at respective significant periods. 
##D ## (Please see our guide booklet for further explanation.)
##D 
##D ## The same plot, but with equidistant color breakpoints: 
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    periodlab = "period (days)")
##D 
##D ## The same plot, but adopting a palette of gray colors, 
##D ## omitting the arrows:
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    plot.arrow = FALSE,
##D    periodlab = "period (days)")
##D          
##D ## The same plot, now with ridge of power:
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    plot.arrow = FALSE,
##D    plot.ridge = TRUE, col.ridge = "red",
##D    periodlab = "period (days)")             
##D          
##D ## The plot, turning back to arrows, now in yellow color:
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow",
##D    periodlab = "period (days)")   
##D          
##D ## Alternate styles of the time axis:          
##D     
##D ## The plot with time elapsed in days, starting from 0 and proceeding 
##D ## in steps of 50 days (50*24 hours), instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24    
##D 
##D ## Insert your specification of time axis: 
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow",
##D    periodlab = "period (days)", timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D 
##D ## The plot with (automatically produced) calendar axis:
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow",
##D    periodlab = "period (days)",
##D    show.date = TRUE, date.format = "%F %T")
##D 
##D ## Individualizing your calendar axis (works with show.date = TRUE)...
##D ## How to obtain, for example, monthly date ticks and labels:
##D 
##D ## The sequence of tick positions:
##D monthly.ticks <- seq(as.POSIXct("2014-11-01 00:00:00", format = "%F %T"), 
##D                      as.POSIXct("2015-11-01 00:00:00", format = "%F %T"), 
##D                      by = "month")
##D ## Observe that the following specification may produce an error:
##D ## 'seq(as.Date("2014-11-01"), as.Date("2015-11-01"), by = "month")'
##D ## Time of the day is missing here!
##D 
##D ## The sequence of labels (e.g. information on month and year only):
##D monthly.labels <- strftime(monthly.ticks, format = "%b %Y")
##D 
##D ## Insert your specification of time axis as parameter to wc.image: 
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (equidistant)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow", 
##D    periodlab = "period (days)",
##D    show.date = TRUE, date.format = "%F %T", 
##D    spec.time.axis = list(at = monthly.ticks, labels = monthly.labels, 
##D                          las = 2))
##D ## Note: 
##D ## The monthly ticks specify the midpoints of the colored cells and 
##D ## match the location of corresponding (default) time index ticks.
##D 
##D ## A cross-wavelet power plot with individualized period axis and exponent 
##D ## to accentuate contrast in the image:
##D wc.image(my.wc, exponent = 0.5, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels 
##D    (raised by exponent 0.5, equidistant levels)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow", 
##D    periodlab = "period (days)",
##D    spec.period.axis = list(at = c(1,2,4,8,16,32,64,128))) 
##D          
##D ## An option to switch to the corresponding frequency axis:
##D my.periods <- c(1,2,4,8,16,32,64,128)
##D my.frequencies <- paste("1/",my.periods, sep = "")
##D wc.image(my.wc, exponent = 0.5, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels
##D    (raised by exponent 0.5, equidistant levels)"),
##D    color.palette = "gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow", 
##D    periodlab = "frequency (per day)", 
##D    spec.period.axis = list(at = my.periods, labels = my.frequencies))            
##D 
##D ## Adding, for example, horizontal lines at period ticks...
##D 
##D ## There is an option to add further objects to the image plot region, 
##D ## by setting 'graphics.reset = FALSE' 
##D ## (but recall previous par settings after plotting):
##D 
##D op <- par(no.readonly = TRUE)
##D wc.image(my.wc, exponent = 0.5, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels
##D    (raised by exponent 0.5, equidistant levels)"),
##D    color.palette="gray( (1:n.levels)/n.levels )", 
##D    col.arrow = "yellow", 
##D    periodlab = "frequency (per day)", 
##D    spec.period.axis = list(at = my.periods, labels = my.frequencies),
##D    timelab = "",
##D    show.date = TRUE, date.format = "%F %T",
##D    graphics.reset = FALSE)            
##D abline(h = log2(my.periods))
##D year2015 <- as.POSIXct("2015-01-01 00:00:00", format = "%F %T")
##D abline(v = year2015)
##D axis(1, at = year2015, labels = 2015, padj = 1)
##D par(op)
##D 
##D ## For further axis plotting options: 
##D ## Please see the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.    
##D             
##D ## Plot of wavelet coherence of x over y, 
##D ## with color breakpoints according to quantiles:
##D wc.image(my.wc, which.image = "wc", 
##D    main = "wavelet coherence, x over y",
##D    legend.params = list(lab = "wavelet coherence levels (quantiles)", 
##D                         lab.line = 3.5, label.digits = 3),
##D    periodlab = "period (days)")
##D 
##D ## Plot of wavelet coherence, but with equidistant color breakpoints:
##D wc.image(my.wc, which.image = "wc", color.key = "i",
##D    main = "wavelet coherence, x over y",
##D    legend.params = list(lab = "wavelet coherence levels (equidistant)"),
##D    periodlab = "period (days)")  
##D    
## End(Not run)



