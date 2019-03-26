library(optmatch)


### Name: stratumStructure
### Title: Return structure of matched sets
### Aliases: stratumStructure stratumStructure.optmatch
###   stratumStructure.default print.stratumStructure

### ** Examples

data(plantdist)
plantsfm <- fullmatch(plantdist) # A full match with unrestricted
                                 # treatment-control balance
plantsfm1 <- fullmatch(plantdist,min.controls=2, max.controls=3)
stratumStructure(plantsfm)
stratumStructure(plantsfm1)
stratumStructure(plantsfm, max.controls=4)




