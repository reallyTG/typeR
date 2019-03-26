library(sirad)


### Name: cst
### Title: Estimate clear sky transmissivity
### Aliases: cst

### ** Examples


data(Metdata)
ref <- Metdata$meteo$RAD_MEA
i <- dayOfYear(Metdata$meteo$DAY)
latr <- radians(Metdata$LATITUDE)
cst(ref,i,latr) 



