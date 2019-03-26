library(WaveletComp)


### Name: analyze.wavelet
### Title: Computation of the wavelet power spectrum of a single time
###   series
### Aliases: analyze.wavelet
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
##D ## There is an option to store the date format and time zone as additional 
##D ## parameters within object 'my.wt' for later reference.    
##D 
##D my.wt <- analyze.wavelet(my.data, "x", 
##D                          loess.span = 0, 
##D                          dt = 1/24, dj = 1/20, 
##D                          lowerPeriod = 1/4, 
##D                          make.pval = TRUE, n.sim = 10,
##D                          date.format = "%F %T", date.tz = "")
##D 
##D ## Plot of wavelet power spectrum (with equidistant color breakpoints):  
##D wt.image(my.wt, color.key = "interval", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels"),
##D    periodlab = "period (days)")
##D 
##D ## Plot of average wavelet power:
##D wt.avg(my.wt, siglvl = 0.05, sigcol = "red", 
##D    periodlab = "period (days)")
##D 
##D ## Please see our guide booklet for further examples:
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.
##D 
## End(Not run)



