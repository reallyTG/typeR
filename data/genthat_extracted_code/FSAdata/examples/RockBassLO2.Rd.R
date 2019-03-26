library(FSAdata)


### Name: RockBassLO2
### Title: Ages (subsample) and lengths (all fish) for Rock Bass from Lake
###   Ontario.
### Aliases: RockBassLO2
### Keywords: datasets

### ** Examples

data(RockBassLO2)
str(RockBassLO2)
head(RockBassLO2)

## extract aged sample
rb.aged <- subset(RockBassLO2,!is.na(age))

## extract length sample
rb.length <- subset(RockBassLO2,is.na(age))




