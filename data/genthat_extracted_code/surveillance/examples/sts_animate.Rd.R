library(surveillance)


### Name: sts_animate
### Title: Animated Maps and Time Series of Disease Counts or Incidence
### Aliases: animate.sts
### Keywords: hplot dynamic spatial

### ** Examples

data("measlesWeserEms")

## animate the weekly counts of measles (during weeks 12-16 only, for speed)
if (require("animation")) {
    oldwd <- setwd(tempdir())  # to not clutter up the current working dir
    saveHTML(animate(measlesWeserEms, tps=12:16),
             title="Evolution of the measles epidemic in the Weser-Ems region",
             ani.width=500, ani.height=600)
    setwd(oldwd)
}

## Not run: 
##D ## animate the weekly incidence of measles (per 100'000 inhabitants),
##D ## and label the time series plot with dates in a specified format
##D animate(measlesWeserEms, tps=12:16,
##D         population = measlesWeserEms@map$POPULATION / 100000,
##D         timeplot = list(as.Date = TRUE,
##D                         scales = list(x = list(format = "%G/%V"))))
## End(Not run)



