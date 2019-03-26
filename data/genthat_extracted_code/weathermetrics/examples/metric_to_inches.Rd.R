library(weathermetrics)


### Name: metric_to_inches
### Title: Convert between standard metric units of measure for
###   precipitation to inches
### Aliases: metric_to_inches

### ** Examples

data(loveland)
loveland$Precip.in <- metric_to_inches(loveland$Precip.mm,
                                       unit.from = "mm",
                                       round = 2)
loveland




