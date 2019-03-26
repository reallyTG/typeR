library(fishmethods)


### Name: fm_telemetry
### Title: Estimation of Fishing and Natural Mortality from Telemetry Data
### Aliases: fm_telemetry
### Keywords: misc

### ** Examples

## Not run: 
##D # Set up for Full model of Hightower et al.(2001)
##D data(Hightower)
##D fm_telemetry(filetype=1,caphistory=Hightower$caphistory, Fdesign=c("1:26"),
##D  Mdesign=c("1:26"),Pdesign = c("2:25"),
##D whichlivecells=list(c(1,5,4), c(6,6,5),
##D  c(7,26,4)), 
##D whichdeadcells=list(c(1,5,4), c(6,6,6),
##D  c(7,26,4)),
##D initial=c(0.05,0.02,0.8),
##D control=list(reltol=1e-5,maxit=1000000))
##D 
##D #Set up for best model F(Qtr,yr), M constant, Pocc
##D fm_telemetry(filetype=1,caphistory=Hightower$caphistory, Fdesign=c("1", "4", "7", "11",
##D  "14", "17", "20", "24"), 
##D Mdesign=c("1"), Pdesign = c("2:27"),
##D whichlivecells=list(c(1,5,4), c(6,6,5),
##D  c(7,26,4)),
##D whichdeadcells=list(c(1,5,4), c(6,6,6),
##D  c(7,26,4)), 
##D initial=c(0.05,0.02,0.8),
##D  control=list(reltol=1e-8,maxit=1000000))
## End(Not run)



