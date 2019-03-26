library(FSA)


### Name: WR79
### Title: Ages and lengths for a hypothetical sample from Westerheim and
###   Ricker (1979).
### Aliases: WR79
### Keywords: datasets

### ** Examples

str(WR79)
head(WR79)

## Extract the aged sample
WR79.aged <- subset(WR79,!is.na(age))
str(WR79.aged)

## Extract the length sample
WR79.length <- subset(WR79,is.na(age))
str(WR79.length)




