library(WaveletComp)


### Name: wt.avg
### Title: Plot of wavelet power averages across time of a single time
###   series
### Aliases: wt.avg
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
##D my.data <- data.frame(x = x)
##D 
##D ## Computation of wavelet power:
##D ## a natural choice of 'dt' in the case of hourly data is 'dt = 1/24',
##D ## resulting in one time unit equaling one day. 
##D ## This is also the time unit in which periods are measured. 
##D my.wt <- analyze.wavelet(my.data, "x", loess.span = 0, 
##D                          dt = 1/24, dj = 1/20, 
##D                          lowerPeriod = 1/4,
##D                          make.pval = TRUE, n.sim = 10)
##D 
##D ## Plot of wavelet power spectrum (with equidistant color breakpoints): 
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant levels)"),
##D    periodlab = "period (days)")
##D ## Note:
##D ## The default time axis shows an index of given points in time, 
##D ## which is the count of hours in our example.
##D          
##D ## With time elapsed in days 
##D ## (starting from 0 and proceeding in steps of 50 days) 
##D ## instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24
##D 
##D ## Insert your specification of time axis: 
##D wt.image(my.wt, color.key = "i", main = "wavelet power spectrum",
##D    legend.params = list(lab = "wavelet power levels (equidistant levels)"),
##D    periodlab = "period (days)", timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D          
##D ## Plot of average wavelet power:
##D wt.avg(my.wt, siglvl = 0.05, sigcol = "red", periodlab = "period (days)")
##D 
##D ## The same plot, but with enhanced symbol size, user-defined period axis, 
##D ## and horizontal grid:
##D wt.avg(my.wt, siglvl = 0.05, sigcol = "red", sigcex = 1.3, 
##D    periodlab = "period (days)",
##D    spec.period.axis = list(at = c(1,8,32,128)), 
##D    periodtck = 1, periodtcl = NULL, 
##D    lwd = 1.5, lwd.axis = 0.25)
##D        
##D ## Another style of the plot: 
##D ## With user-defined period axis and axis of averages, 
##D ## minimum and maximum plot levels of averages:
##D 
##D op <- par(no.readonly = TRUE)
##D par(cex.lab = 1.3, cex.axis = 1.1)
##D wt.avg(my.wt, siglvl = 0.05, sigcol = "red", sigcex = 1.3, 
##D    minimum.level = 0, maximum.level = 11,
##D    periodlab = "period (days)", 
##D    spec.period.axis = list(at = c(1,8,32,128)), 
##D    spec.avg.axis = list(at = 0:10),
##D    lwd = 1.5)
##D par(op)   
##D ## Note:
##D ## 'cex.axis' in 'par' controls for the size of axis tick labels, 
##D ## while 'cex.lab' controls for the size of axis and legend labels. 
##D ## Scaling by 'cex' would also affect 'sigcex'. 
##D 
##D 
##D ## Please see also the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.
##D 
## End(Not run)



