library(WaveletComp)


### Name: analyze.coherency
### Title: Computation of the cross-wavelet power and wavelet coherence
###   spectrum of two time series
### Aliases: analyze.coherency
### Keywords: ts

### ** Examples

## Not run: 
##D ## The following example is modified from Veleda et al, 2012:
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
##D ## There is an option to store the date format and time zone as additional
##D ## parameters within object 'my.wc' for later reference. 
##D 
##D my.wc <- analyze.coherency(my.data, c("x","y"), 
##D                            loess.span = 0, 
##D                            dt = 1/24, dj = 1/20, 
##D                            window.size.t = 1, window.size.s = 1/2, 
##D                            lowerPeriod = 1/4,
##D                            make.pval = TRUE, n.sim = 10,
##D                            date.format = "%F %T", date.tz = "")
##D ## Note:                           
##D ## By default, Bartlett windows are used for smoothing in order to obtain
##D ## the wavelet coherence spectrum; window lengths in this example:
##D ## 1*24 + 1 = 25 observations in time direction,
##D ## (1/2)*20 + 1 = 11 units in scale (period) direction.                             
##D                          
##D ## Plot of cross-wavelet power 
##D ## (with color breakpoints according to quantiles):
##D wc.image(my.wc, main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels"),
##D    periodlab = "period (days)")
##D    
##D ## The same plot, now with calendar axis
##D ## (according to date format stored in 'my.wc'):
##D wc.image(my.wc, main = "cross-wavelet power spectrum, x over y",
##D    legend.params = list(lab = "cross-wavelet power levels"),
##D    periodlab = "period (days)", show.date = TRUE)   
##D          
##D ## Plot of average cross-wavelet power:
##D wc.avg(my.wc, siglvl = 0.05, sigcol = 'red', 
##D    periodlab = "period (days)")
##D 
##D ## Plot of wavelet coherence 
##D ## (with color breakpoints according to quantiles):
##D wc.image(my.wc, which.image = "wc",  main = "wavelet coherence, x over y", 
##D    legend.params = list(lab = "wavelet coherence levels", 
##D                         lab.line = 3.5, label.digits = 3),
##D    periodlab = "period (days)")
##D          
##D ## plot of average coherence:
##D wc.avg(my.wc, which.avg = "wc", 
##D    siglvl = 0.05, sigcol = 'red', 
##D    legend.coords = "topleft", 
##D    periodlab = "period (days)")
##D 
##D ## Please see our guide booklet for further examples:
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.
##D 
## End(Not run)



