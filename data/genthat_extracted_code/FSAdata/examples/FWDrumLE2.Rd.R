library(FSAdata)


### Name: FWDrumLE2
### Title: Ages (subsample) and lengths (all fish) for Freshwater Drum from
###   Lake Erie.
### Aliases: FWDrumLE2
### Keywords: datasets

### ** Examples

data(FWDrumLE2)
str(FWDrumLE2)
head(FWDrumLE2)
## Extract the aged sample
FWD.aged <- subset(FWDrumLE2,!is.na(age))
str(FWD.aged)
## Extract the length sample
FWD.length <- subset(FWDrumLE2,is.na(age))
str(FWD.length)




