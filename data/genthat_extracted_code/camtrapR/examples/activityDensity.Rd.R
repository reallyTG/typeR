library(camtrapR)


### Name: activityDensity
### Title: Plot kernel density estimation of single-species activity
### Aliases: activityDensity

### ** Examples

# load record table
data(recordTableSample)

species4activity <- "VTA"    # = Viverra tangalunga, Malay Civet

activityDensity(recordTable = recordTableSample,
                species     = species4activity)


# all species at once

activityDensity(recordTable = recordTableSample,
                allSpecies  = TRUE,
                writePNG    = FALSE,
                plotR       = TRUE,
                add.rug     = TRUE)



