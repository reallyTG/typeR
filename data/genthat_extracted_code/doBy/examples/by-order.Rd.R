library(doBy)


### Name: by-order
### Title: Ordering (sorting) rows of a data frame
### Aliases: by-order orderBy
### Keywords: utilities

### ** Examples


orderBy(~ conc + Treatment, CO2)
## Sort decreasingly by conc
orderBy(~ - conc + Treatment, CO2)



