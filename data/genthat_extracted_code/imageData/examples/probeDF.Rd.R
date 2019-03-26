library(imageData)


### Name: probeDF
### Title: Compares, for a set of specified values of df, a response and
###   the smooths of it, possibly along with growth rates calculated from
###   the smooths
### Aliases: probeDF
### Keywords: hplot manip

### ** Examples

data(exampleData)
vline <- list(ggplot2::geom_vline(xintercept=20, linetype="longdash", size=1),
              ggplot2::scale_x_continuous(breaks=seq(12, 36, by=2)))
probeDF(data = longi.dat, response = "Area", df = c(4,7), x="xDays+24.16666667", 
        ggplotFuncs=vline)



