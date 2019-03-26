library(paleotree)


### Name: plotOccData
### Title: Plotting Occurrence Data Across Taxa
### Aliases: plotOccData

### ** Examples

#load example graptolite PBDB occ dataset
data(graptPBDB)

#get formal genera
occSpecies <- taxonSortPBDBocc(graptOccPBDB, rank = "species")

#plot it!
plotOccData(occSpecies)

#this isn't too many occurrences, because there are so few
    #formal grapt species in the PBDB

#genera is messier...

#get formal genera
occGenus <- taxonSortPBDBocc(graptOccPBDB, rank = "genus")

#plot it!
plotOccData(occGenus)

#some of those genera have occurrences with very large
   #age uncertainties on them!




