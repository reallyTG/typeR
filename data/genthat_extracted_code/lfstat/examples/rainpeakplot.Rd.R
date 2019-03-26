library(lfstat)


### Name: recessionplot
### Title: Recession diagnostic plot
### Aliases: recessionplot

### ** Examples

## Not run: 
##D data(ngaruroro)
##D #To few points identified as peak flood discharge
##D recessionplot(ngaruroro, peaklevel = .5, start = 1991, end = 1991)
##D 
##D #To many
##D recessionplot(ngaruroro, peaklevel = .999, start = 1991, end = 1991)
##D 
##D #Good choice?
##D recessionplot(ngaruroro, peaklevel = .92, start = 1991, end = 1991)
##D 
##D #Getting peakdays for 1991
##D peak <- recessionplot(ngaruroro, peaklevel = .92, plot = FALSE)
##D rain1991 <- subset(ngaruroro, subset = hyear == 1991 && peak, select = c(day, month, year))
## End(Not run)




