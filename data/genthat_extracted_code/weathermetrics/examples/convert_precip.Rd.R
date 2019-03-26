library(weathermetrics)


### Name: convert_precip
### Title: Convert between precipitation metrics
### Aliases: convert_precip

### ** Examples


data(breck)
breck$Precip.mm <- convert_precip(breck$Precip.in,
   old_metric = "inches", new_metric = "mm", round = 2)
breck

data(loveland)
loveland$Precip.in <- convert_precip(loveland$Precip.mm,
   old_metric = "mm", new_metric = "inches", round = NULL)
loveland$Precip.cm <- convert_precip(loveland$Precip.mm,
   old_metric = "mm", new_metric = "cm", round = 3)
loveland



