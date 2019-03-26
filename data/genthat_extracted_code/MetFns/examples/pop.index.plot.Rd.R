library(MetFns)


### Name: pop.index.plot
### Title: Plot of population index
### Aliases: pop.index.plot

### ** Examples

## calculate and make plot of population index for observations of 2015 Orionids,
## time period around maximum, 21th to 25th October, 
## min bin size 0.16 degrees (4 hours), max bin size 1 degree, 
## number of meteors equals 100 
## First select magnitude data for Orionids activity from 21th to 25th October, 
## limiting magnitudes above 5, radiant elevation above 20 degrees, 
## percentage of clouds below 20
ori2015mag<-filter(magn2015,date.start="2015-10-21",date.end="2015-10-25",
shw="ORI",P.up=20,mag.low=5,h.low=20)
oripop<-pop.index2(ori2015mag,date.start="2015-10-21",date.end="2015-10-25",
shw="ORI",kmin=0.16,kmax=1,num=100)
pop.index.plot(oripop,xlim1=207,xlim2=211,xinc=1,ylim1=1.6,ylim2=2.4,yinc=0.2)

## change date tick marks on secondary x-axis, to show date at midnight
pop.index.plot(oripop,xlim1=207,xlim2=211,xinc=1,ylim1=1.5,ylim2=2.5,
yinc=0.2,dlim1="2015-10-21",dlim2="2015-10-25",dinc=1,dunit="day")



