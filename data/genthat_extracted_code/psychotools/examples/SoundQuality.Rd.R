library(psychotools)


### Name: SoundQuality
### Title: Quality of Multichannel Reproduced Sound
### Aliases: SoundQuality
### Keywords: datasets

### ** Examples

data("SoundQuality", package = "psychotools")
summary(SoundQuality$preference)
ftable(xtabs(~ time + repet + progmat, data = SoundQuality))



