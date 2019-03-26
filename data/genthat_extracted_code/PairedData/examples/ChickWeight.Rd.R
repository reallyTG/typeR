library(PairedData)


### Name: ChickWeight
### Title: Chick weight data from Preece (1982, Table 11)
### Aliases: ChickWeight
### Keywords: datasets

### ** Examples

data(ChickWeight)

# Look at the interesting discussion in Preece (1982)
# about degree of precision and t test
with(ChickWeight,plot(paired(Confinement,OpenRange)))
with(ChickWeight,stem(Confinement-OpenRange,scale=2))



