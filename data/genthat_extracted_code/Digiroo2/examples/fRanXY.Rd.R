library(Digiroo2)


### Name: fRanXY
### Title: Extract random points from within an individual's home range
### Aliases: fRanXY

### ** Examples


## Load required packages
library(adehabitatHR)
library(raster)

## Load study data
data(StudyArea)
data(Roos)

coordinates(Roos) <- ~x+y

## Estimation of UD and KUD 95% for the 10 animals
ud <- kernelUD(Roos,h="href",same4all=TRUE)
ver95 <- getverticeshr(ud,95,unin = c("m"),unout=c("ha"))

## Conversion from a adehabitat UDm object into a sgdf object
udsgdf <- as(estUDm2spixdf(ud),"SpatialGridDataFrame")

## For 3 animals, extract a random point falling within their respective KUD 95%
fRanXY(1:3,ver95)

## For 3 animals, extract a probability weighted random point falling within 
## their respective utilisation distributions
fRanXY(1:3,udsgdf)



