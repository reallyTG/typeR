library(Digiroo2)


### Name: fDrawfigure
### Title: Plot the location of the random point falling within an
###   individual's home range
### Aliases: fDrawfigure

### ** Examples


## Load required packages
library(adehabitatHR)

## Load study data
data(StudyArea)
data(Roos)

# Subset the data for only 1 individual
RooSubid <- 'Stripes'
RooSub <- subset(Roos,Roos$ID==RooSubid)
RooSub$ID <- as.character(RooSub$ID)

coordinates(RooSub) <- ~x+y

## Estimation of UD and KUD 95% for 1 animal
ud <- kernelUD(RooSub,h="href",same4all=TRUE)
ver95 <- getverticeshr(ud,95,unin = c("m"),unout=c("ha"))
udsgdf <- as(estUDm2spixdf(ud),"SpatialGridDataFrame")

## Extract random points falling within animal #1's KUD 95%
fDrawfigure(1,ver95,RooSub,StudyArea) 

## Extract probability-weighted random points falling within 
## animal #1's UD and draw on map of the study area. 
fDrawfigure(1,udsgdf,RooSub,StudyArea)



