library(MALDIquant)


### Name: findEmptyMassObjects
### Title: Finds or removes empty AbstractMassObject objects in a list.
### Aliases: findEmptyMassObjects removeEmptyMassObjects
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create list
peakList <- list()

## create two MassPeaks objects and add them to the list
peakList[[1]] <- createMassPeaks(mass=1:100, intensity=1:100,
                                 metaData=list(name="example 1"))
peakList[[2]] <- createMassPeaks(mass=1:100, intensity=1:100,
                                 metaData=list(name="example 2"))

## find empty objects (there should not be any one)
findEmptyMassObjects(peakList)

## add an empty MassPeaks object to the list
peakList[[3]] <- createMassPeaks(mass=double(), intensity=double(),
                                 metaData=list(name="empty MassPeaks object"))

## look for empty objects (isEmptyIdx == 3)
(isEmptyIdx <- findEmptyMassObjects(peakList))

## to remove all empty MassObjects from a list
length(peakList) # 3
peakList <- removeEmptyMassObjects(peakList)
length(peakList) # 2; WARNING: all indices could changed



