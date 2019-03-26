library(bmlm)


### Name: isolate
### Title: Create isolated within- (and optionally between-) person
###   variables.
### Aliases: isolate

### ** Examples

# Create within-person deviations of work stressors in BLch9.
data(BLch9)
BLch9 <- isolate(BLch9, by = "id", value = "fwkstrs")
head(BLch9)  # Now has new column for within-person work stressors.




