library(FSAdata)


### Name: Morwong4a
### Title: Ages (subsample) and lengths (all fish) for Morwong from
###   Morwong4.
### Aliases: Morwong4a
### Keywords: datasets

### ** Examples

data(Morwong4a)
str(Morwong4a)
head(Morwong4a)

## extract aged sample
m4a.aged <- subset(Morwong4a,!is.na(age))
str(m4a.aged)

## extract length sample
m4a.length <- subset(Morwong4a,is.na(age))
str(m4a.length)




