library(agridat)


### Name: lambert.soiltemp
### Title: Average monthly soil temperature near Zurich
### Aliases: lambert.soiltemp
### Keywords: datasets

### ** Examples

# Reproduce Lambert figure 39.

data(lambert.soiltemp)
dat <- lambert.soiltemp

# Make 3 cycles of the data so that the loess line bends back up at
# month 1 and month 12
dat <- rbind(dat, transform(dat, month=month-12),
             transform(dat, month=month+12))
require(lattice)
xyplot(temp ~ month, dat, group=depth, type=c('p','smooth'),
       main="lambert.soiltemp",
       xlim=c(-3,15), ylab="Soil temperature (du Crest) at depth (feet)",
       span=.2, auto.key=list(columns=4))

# To do: Find a good model for this data



