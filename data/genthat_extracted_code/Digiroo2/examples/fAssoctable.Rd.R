library(Digiroo2)


### Name: fAssoctable
### Title: Convert nearest neighbour object into a dataset of expected
###   groups which is compatible with SOCPROG 2.4
### Aliases: fAssoctable

### ** Examples


## Load required packages 
library(adehabitatHR)

## Load study data
data(StudyArea)
data(Roos)

## Convert into a spatial object
coordinates(Roos) <- ~x+y

## Estimation of UD and KUD 95% for the 10 animals
ud <- kernelUD(Roos,h="href",same4all=TRUE)
ver95 <- getverticeshr(ud,95,unin = c("m"),unout=c("ha"))
udsgdf <- as(estUDm2spixdf(ud),"SpatialGridDataFrame")

## For all 10 individuals, extract probability weighted random points 
## falling within their respective utilisation distributions
ranXY <- fRanXY(1:10,udsgdf)
coordinates(ranXY) <- ~x+y

## Run Nearest neighbour function with those interactions < 50 m to generate the nb object
## See ?dnearneigh in the spdep package for more information
Gprox <- 50
dnn_digi <- dnearneigh(ranXY,d1=0,d2=Gprox, row.names=as.character(ranXY$ID))

## Convert random points into a dataset of expected groups by detecting associations
## by proximity and converting them into a format accepted by SOCPROG 2.4
fAssoctable(dnn_digi) 



