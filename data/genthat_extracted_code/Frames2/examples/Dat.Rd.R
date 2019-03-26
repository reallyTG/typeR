library(Frames2)


### Name: Dat
### Title: Joint sample database
### Aliases: Dat
### Keywords: datasets

### ** Examples

data(Dat)
attach(Dat)

#We are going to split dataset Dat into two new datasets, each 
#one corresponding to a frame: frame containing individuals
#using landline and frame containing individuals using cell phone.

FrameLandline <- Dat[Landline == 1,]
FrameCell <- Dat[Cell == 1,]

#Equally, we can split the original dataset in three new different 
#datasets, each one corresponding to one domain: first domain containing
#individuals using only landline, second domain containing individuals
#using only cell phone and the third domain containing individuals
#using both landline and cell phone.

DomainLandline <- Dat[Landline == 1 & Cell == 0,]
DomainCell <- Dat[Landline == 0 & Cell == 1,]
DomainBoth <- Dat[Landline == 1 & Cell == 1,]

#From the domain datasets, we can build frame datasets

FrameLandline <- rbind(DomainLandline, DomainBoth)
FrameCell <- rbind(DomainCell, DomainBoth)



