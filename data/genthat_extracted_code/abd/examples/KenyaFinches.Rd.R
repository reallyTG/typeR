library(abd)


### Name: KenyaFinches
### Title: Body Mass and Beak Length in Three Species of Finches in Kenya
### Aliases: KenyaFinches
### Keywords: datasets

### ** Examples

table(KenyaFinches$species)
xyplot(beak.length ~ species, KenyaFinches)
bwplot(beak.length ~ species, KenyaFinches)



