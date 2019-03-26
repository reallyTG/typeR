library(FSAdata)


### Name: StripedBass3
### Title: Ages (subsample) and lengths (all fish) for Striped Bass.
### Aliases: StripedBass3
### Keywords: datasets

### ** Examples

data(StripedBass3)
str(StripedBass3)
head(StripedBass3)

## Extract the aged sample
sb.aged <- subset(StripedBass3,!is.na(age))
str(sb.aged)

## Extract the length sample
sb.length <- subset(StripedBass3,is.na(age))
str(sb.length)




