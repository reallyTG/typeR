library(surveillance)


### Name: fluBYBW
### Title: Influenza in Southern Germany
### Aliases: fluBYBW
### Keywords: datasets

### ** Examples

data("fluBYBW")
# Count time series plot
plot(fluBYBW, type = observed ~ time)
# Map of disease incidence (per 100000 inhabitants) for the year 2001
plot(fluBYBW, type = observed ~ unit, tps = 1:52, total.args = list(),
     population = fluBYBW@map$X31_12_01 / 100000)
# the overall rate for 2001 shown in the bottom right corner is
sum(observed(fluBYBW[1:52,])) / sum(fluBYBW@map$X31_12_01) * 100000

## Not run: 
##D # Generating an animation takes a while.
##D # Here we take the first 20 weeks of 2001 (runtime: ~3 minutes).
##D # The full animation is available in Supplement A of Meyer and Held (2014)
##D if (require("animation")) {
##D     oldwd <- setwd(tempdir())  # to not clutter up the current working dir
##D     saveHTML(animate(fluBYBW, tps = 1:20),
##D              title="Evolution of influenza in Bayern and Baden-Wuerttemberg",
##D              ani.width=500, ani.height=600)
##D     setwd(oldwd)
##D }
## End(Not run)



