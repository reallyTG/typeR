library(FSAdata)


### Name: SnapperHG1
### Title: Age (subsample) and length (all fish) of Snapper from two survey
###   locations.
### Aliases: SnapperHG1
### Keywords: datasets

### ** Examples

data(SnapperHG1)
str(SnapperHG1)
head(SnapperHG1)

## Extract one of the sample surveys
sn1 <- subset(SnapperHG1,survey=="KAH8810")

## Extract the aged sample
sn1.aged <- subset(sn1,!is.na(age))
str(sn1.aged)

## Extract the length sample
sn1.length <- subset(sn1,is.na(age))
str(sn1.length)




