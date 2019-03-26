library(MetFns)


### Name: pop.index
### Title: Calculation of population index
### Aliases: pop.index

### ** Examples

##calculate population index for observations of 2015 Orionids, 
## time period 21th to 25th October, bin size 1 degree

## First select magnitude data for Orionids activity from 21th to 25th October, 
## limiting magnitudes above 5, radiant elevation above 20 degrees,
## percentage of clouds below 20
magnOri<-filter(magn2015,date.start="2015-10-21",date.end="2015-10-25",
shw="ORI",P.up=20,mag.low=5,h.low=20)
pop.index(magnOri,date.start="2015-10-21",date.end="2015-10-25",shw="ORI",k=1)




