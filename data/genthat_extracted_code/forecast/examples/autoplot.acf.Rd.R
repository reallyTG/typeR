library(forecast)


### Name: autoplot.acf
### Title: ggplot (Partial) Autocorrelation and Cross-Correlation Function
###   Estimation and Plotting
### Aliases: autoplot.acf ggAcf ggPacf ggCcf autoplot.mpacf ggtaperedacf
###   ggtaperedpacf

### ** Examples


library(ggplot2)
ggAcf(wineind)
wineind %>% Acf(plot=FALSE) %>% autoplot
## Not run: 
##D wineind %>% taperedacf(plot=FALSE) %>% autoplot
##D ggtaperedacf(wineind)
##D ggtaperedpacf(wineind)
## End(Not run)
ggCcf(mdeaths, fdeaths)




