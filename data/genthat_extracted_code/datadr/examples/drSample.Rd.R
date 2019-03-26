library(datadr)


### Name: drSample
### Title: Take a Sample of Key-Value Pairs Take a sample of key-value
###   Pairs
### Aliases: drSample

### ** Examples

bySpecies <- divide(iris, by = "Species")
set.seed(234)
sampleRes <- drSample(bySpecies, fraction = 0.25)



