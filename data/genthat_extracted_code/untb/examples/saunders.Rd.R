library(untb)


### Name: saunders
### Title: Dataset due to Saunders
### Aliases: saunders saunders.tot saunders.exposed saunders.exposed.tot
###   saunders.sheltered saunders.sheltered.tot
### Keywords: datasets

### ** Examples

data(saunders)
plot(saunders.sheltered.tot, uncertainty=TRUE, n=1)

preston(saunders.tot)

optimal.params.sloss(saunders.exposed)




