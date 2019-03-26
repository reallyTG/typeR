library(camtrapR)


### Name: activityHistogram
### Title: Plot histogram of single-species activity
### Aliases: activityHistogram

### ** Examples


# load record table
data(recordTableSample)

# generate activity histogram
species4activity <- "VTA"    # = Viverra tangalunga, Malay Civet

activityHistogram (recordTable = recordTableSample,
                   species     = species4activity,
                   allSpecies = FALSE)



