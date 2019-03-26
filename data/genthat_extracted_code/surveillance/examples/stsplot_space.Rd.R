library(surveillance)


### Name: stsplot_space
### Title: Map of Disease Counts/Incidence accumulated over a Given Period
### Aliases: stsplot_space
### Keywords: hplot spatial

### ** Examples

data("measlesWeserEms")

# default plot: total region-specific counts over all weeks
plot(measlesWeserEms, type=observed~unit)

# compare with old implementation
plot(measlesWeserEms, type=observed~1|unit)

# plot cumulative incidence (per 100000 inhabitants), with region labels
plot(measlesWeserEms, type=observed~unit,
     population=measlesWeserEms@map$POPULATION / 100000,
     labels=list(labels="GEN", cex=0.7, font=3))

# counts in the first week of the second year only (+ display overall)
plot(measlesWeserEms, type=observed~unit, tps=53, total.args=list())

# if we had only observed a subset of the regions
plot(measlesWeserEms[,5:11], type = observed~unit,
     gpar.missing = list(col="gray", lty=4))



