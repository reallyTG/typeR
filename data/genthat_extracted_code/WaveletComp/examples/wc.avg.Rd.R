library(WaveletComp)


### Name: wc.avg
### Title: Plot cross-wavelet power averages and wavelet coherence averages
###   across time of two time series
### Aliases: wc.avg
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
##D ## Plot of cross-wavelet power, 
##D ## with color breakpoints according to quantiles:
##D wc.image(my.wc, main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels (quantiles)"),
##D    periodlab = "period (days)")
##D ## Note:
##D ## The default time axis shows an index of given points in time, 
##D ## which is the count of hours in our example.      
##D ## By default, arrows are plotted which show the phase differences 
##D ## of x over y at respective significant periods. 
##D ## (Please see our guide booklet for further explanation.)
##D          
##D ## With time elapsed in days 
##D ## (starting from 0 and proceeding in steps of 50 days)
##D ## instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24
##D 
##D ## Insert your specification of the time axis: 
##D wc.image(my.wc, color.key = "i", 
##D    main = "cross-wavelet power spectrum, x over y", 
##D    legend.params = list(lab = "cross-wavelet power levels (quantiles)"),
##D    periodlab = "period (days)", timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D        
##D ## Plot of average cross-wavelet power:
##D wc.avg(my.wc, siglvl = 0.05, sigcol = "red", periodlab = "period (days)")
##D 
##D ## The same plot, but with enhanced symbol size, user-defined axes, 
##D ## minimum and a maximum plot level of averages:
##D wc.avg(my.wc, siglvl = 0.05, sigcol = "red", sigcex = 1.5, 
##D    minimum.level = 0, maximum.level = 17, 
##D    periodlab = "period (days)",
##D    spec.period.axis = list(at = c(1,2,4,8,16,32,64,128)), 
##D    spec.avg.axis = list(at = seq(0,16,2)), 
##D    lwd = 1.5)
##D        
##D ## Another style of the plot:
##D ## 'cex.axis' in 'par' controls for the size of axis tick labels, 
##D ## while 'cex.lab' controls for the size of axis and legend labels. 
##D ## Note that scaling by 'cex' would also affect 'sigcex'. 
##D op <- par(no.readonly = TRUE)
##D par(cex.lab = 1.3, cex.axis = 1.1)
##D wc.avg(my.wc, siglvl = 0.05, sigcol = "red", sigcex = 1.5, 
##D    minimum.level = 0, maximum.level = 17, 
##D    periodlab = "period (days)",
##D    spec.period.axis = list(at = c(1,2,4,8,16,32,64,128)), 
##D    spec.avg.axis = list(at = seq(0,16,2)),
##D    lwd = 1.5)
##D par(op)      
##D 
##D ## Plot of wavelet coherence 
##D ## (with color breakpoints according to quantiles):
##D wc.image(my.wc, which.image = "wc", main = "wavelet coherence, x over y",
##D    legend.params = list(label.digits = 3),
##D    periodlab = "period (days)")
##D          
##D ## Plot of average wavelet coherence:
##D wc.avg(my.wc, which.avg = "wc", 
##D    siglvl = 0.05, sigcol = "red", legend.coords = "topleft", 
##D    periodlab = "period (days)", 
##D    lwd = 1.5)
##D 
##D ## The same plot, setting the minimum plot level of averages to 0: 
##D wc.avg(my.wc, which.avg = "wc", 
##D    siglvl = 0.05, sigcol = "red", legend.coords = "topleft", 
##D    minimum.level = 0, 
##D    periodlab = "period (days)", 
##D    lwd = 1.5)
##D  
##D ## Please see also the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.
##D 
## End(Not run)



