library(WaveletComp)


### Name: reconstruct
### Title: Reconstruction of a (detrended) time series from output provided
###   by an object of class '"analyze.wavelet"' or '"analyze.coherency"'
### Aliases: reconstruct
### Keywords: ts

### ** Examples

## Not run: 
##D ## The following example is adopted from Liu et al., 2007:
##D 
##D series.length = 6*128*24
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
##D my.w <- analyze.wavelet(my.data, "x", 
##D                        loess.span = 0, 
##D                        dt = 1/24, dj = 1/20, 
##D                        lowerPeriod = 1/4, 
##D                        make.pval = TRUE, n.sim = 10)
##D 
##D ## Plot of wavelet power spectrum (with equidistant color breakpoints):  
##D wt.image(my.w, color.key = "interval", 
##D    legend.params = list(lab = "wavelet power levels"),
##D    periodlab = "period (days)")
##D 
##D ## Reconstruction of the time series, 
##D ## including significant components only: 
##D reconstruct(my.w)
##D 
##D ## The same reconstruction, but showing wave components first:
##D reconstruct(my.w, plot.waves = TRUE)
##D 
##D ## Reconstruction, including all components whether significant or not: 
##D reconstruct(my.w, only.sig = FALSE)
##D 
##D ## Reconstruction, including significant components, 
##D ## but selected periods only (e.g. ignoring period 8):  
##D reconstruct(my.w, sel.period = c(1,32,128))
##D 
##D ## Reconstruction, including significant components,
##D ## but the ridge only:
##D reconstruct(my.w, only.ridge = TRUE)
##D 
##D ## Alternate styles of the time axis:
##D 
##D ## The plot with time elapsed in days, starting from 0 and proceeding 
##D ## in steps of 50 days (50*24 hours),
##D ## instead of the (default) time index:
##D index.ticks  <- seq(1, series.length, by = 50*24)
##D index.labels <- (index.ticks-1)/24
##D 
##D ## Insert your specification of time axis: 
##D reconstruct(my.w, only.ridge = TRUE,
##D    timelab = "time elapsed (days)",
##D    spec.time.axis = list(at = index.ticks, labels = index.labels))
##D             
##D ## See the periods involved:
##D my.rec <- reconstruct(my.w, only.ridge = TRUE)
##D print(my.rec$Period[my.rec$rnum.used])
##D 
##D ## The original and reconstructed time series can be retrieved:
##D plot(my.rec$series$x, type = "l", xlab = "index", ylab = "")
##D lines(my.rec$series$x.r, col="red")
##D legend("topleft", legend = c("original","reconstructed"), 
##D        lty = 1, col = c("black","red"))
##D 
##D ## Please see also the examples in our guide booklet,
##D ## URL http://www.hs-stat.com/projects/WaveletComp/WaveletComp_guided_tour.pdf.
##D 
## End(Not run)



