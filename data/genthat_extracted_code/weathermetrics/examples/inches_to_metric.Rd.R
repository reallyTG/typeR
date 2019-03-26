library(weathermetrics)


### Name: inches_to_metric
### Title: Convert from inches to standard metric units of measure for
###   precipitation
### Aliases: inches_to_metric

### ** Examples

data(breck)
breck$Precip.mm <- inches_to_metric(breck$Precip.in,
                                    unit = "mm",
                                    round = 2)
breck




