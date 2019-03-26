library(FSAdata)


### Name: SpotVA2
### Title: Ages (subsample) and lengths (all fish) for Spot.
### Aliases: SpotVA2
### Keywords: datasets

### ** Examples

data(SpotVA2)
str(SpotVA2)
head(SpotVA2)

## Extract the aged sample
spot.aged <- subset(SpotVA2,!is.na(age))
str(spot.aged)

## Extract the length sample
spot.length <- subset(SpotVA2,is.na(age))
str(spot.length)




