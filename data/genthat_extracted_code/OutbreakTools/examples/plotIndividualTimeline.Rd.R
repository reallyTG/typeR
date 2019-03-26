library(OutbreakTools)


### Name: plotIndividualTimeline
### Title: Plot a timeline of recorded data
### Aliases: plotIndividualTimeline

### ** Examples

## simple example using ToyOutbreak
data(ToyOutbreak)
plotIndividualTimeline(ToyOutbreak)
plotIndividualTimeline(ToyOutbreak, what="DateInfected", colorBy="Sex")
plotIndividualTimeline(ToyOutbreak, what="DateInfected", colorBy="Age",
   orderBy="Sex")

plotIndividualTimeline(ToyOutbreak,selection=1:15,orderBy='lat')
plotIndividualTimeline(ToyOutbreak,selection=1:15,orderBy='lat',
   colorBy="Sex", size=4)


## example using HorseFlu
data(HorseFlu)

## plot all information, coloring by yard - messy!
plotIndividualTimeline(HorseFlu,colorBy='yardID')

## sort on yard, only DNA sequence collection
plotIndividualTimeline(HorseFlu, what="dna", orderBy='yardID',colorBy='yardID')

## just plot the first 30, vaccination dates
plotIndividualTimeline(HorseFlu, what=c("FirstVac","LastVac"),
   selection=1:30,orderBy='yardID',colorBy='yardID', size=3)





