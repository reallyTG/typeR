library(traitdataform)


### Name: as.metadata
### Title: Create metadata for trait dataset
### Aliases: as.metadata

### ** Examples


# set metadata object
a <- as.metadata(author = "Martin Gossner", datasetName = "Heteroptera morphometric traits")

# update an existing metadata object
a1 <- as.metadata(datasetID = "heteroptera", template = a)




