library(IsoriX)


### Name: isofind
### Title: Infer spatial origins
### Aliases: isofind print.ISOFIND summary.ISOFIND
### Keywords: models regression

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 200) {

## We fit the models for Germany
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

GermanFit <- isofit(data = GNIPDataDEagg,
                    mean_model_fix = list(elev = TRUE, lat_abs = TRUE))


## We build the isoscape
GermanScape <- isoscape(raster = ElevRasterDE,
                        isofit = GermanFit)


## We fit the calibration model
CalibAlien <- calibfit(data = CalibDataAlien,
                       isofit = GermanFit)

## We perform the assignment on land only
AssignmentDry <- isofind(data = AssignDataAlien,
                         isoscape = GermanScape,
                         calibfit = CalibAlien)

## perform the assignment on land and water
Assignment <- isofind(data = AssignDataAlien,
                      isoscape = GermanScape,
                      calibfit = CalibAlien,
                      mask = NULL)

## We plot the group assignment
plot(Assignment, who = "group", mask = list(mask = NULL))

plot(AssignmentDry, who = "group", mask = list(mask = NULL))

## We plot the assignment for the 8 first samples
plot(AssignmentDry, who = 1:8,
     sources = list(draw = FALSE),
     calibs = list(draw = FALSE))

## We plot the assignment for the sample "Alien_10"
plot(AssignmentDry, who = "Alien_10")


### Other example without calibration:
### We will try to assign a weather station 
### in the water isoscape

## We create the assignment data taking 
## GARMISCH-PARTENKIRCHEN as the station to assign
GPIso <- GNIPDataDEagg[GNIPDataDEagg$source_ID == "GARMISCH-PARTENKIRCHEN", "mean_source_value"]
AssignDataGP <- data.frame(sample_value = GPIso,
                           sample_ID = "GARMISCH-PARTENKIRCHEN")

## We perform the assignment
AssignedGP <- isofind(data = AssignDataGP,
                      isoscape = GermanScape,
                      calibfit = NULL)
## We plot the assignment and 
## show where the station really is (using lattice)
plot(AssignedGP) +
  xyplot(47.48~11.06,
         panel = panel.points,
         cex = 5, pch = 13, lwd = 2, col = "black") 


}




