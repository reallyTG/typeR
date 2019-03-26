library(FSAdata)


### Name: SnapperHG2
### Title: Ages (subsample) and lengths (all fish) for Snapper.
### Aliases: SnapperHG2
### Keywords: datasets

### ** Examples

data(SnapperHG2)
str(SnapperHG2)
head(SnapperHG2)

## Extract the aged sample
sn2.aged <- subset(SnapperHG2,!is.na(age))
str(sn2.aged)

## Extract the length sample
sn2.length <- subset(SnapperHG2,is.na(age))
str(sn2.length)




