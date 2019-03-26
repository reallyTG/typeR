library(OIdata)


### Name: birds
### Title: Aircraft-Wildlife Collisions
### Aliases: birds
### Keywords: datasets bird airplane flight wildlife

### ** Examples

data(birds)
table(birds$phase_of_flt)
phase.ord <- sort(table(birds$phase_of_flt), decreasing = TRUE)
par(mar=c(6, 4, 4, 2) + 0.1)
barplot(phase.ord, las = 2)
summary(birds$height)

mosaicplot(birds$phase_of_flt ~ birds$effect, las = 2)



