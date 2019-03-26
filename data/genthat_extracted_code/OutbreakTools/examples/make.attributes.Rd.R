library(OutbreakTools)


### Name: make.tip.attributes
### Title: Obtain meta data for items in 'obkData' objects
### Aliases: make.tip.attributes make.individual.attributes
###   make.sequence.attributes
### Keywords: classes

### ** Examples

data(ToyOutbreak)
data(HorseFlu)

head(make.tip.attributes(ToyOutbreak))

head(make.sequence.attributes(HorseFlu))

## no repeated measures
head(make.individual.attributes(ToyOutbreak))

## note wide format when there are repeated measures
head(make.individual.attributes(HorseFlu))



