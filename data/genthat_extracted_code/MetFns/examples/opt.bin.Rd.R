library(MetFns)


### Name: opt.bin
### Title: Divides data in blocks of optimal bin sizes
### Aliases: opt.bin

### ** Examples

## Divide 2015 Orionids rate data into blocks of optimal sizes.
## Consider time period around the maximum, 21th to 25th October, 
## min bin size 0.16 degrees (4 hours), max bin size 1 degree, 
## number of meteors equals 100

## First select rate data for Orionids activity from 21th to 25th October, 
## limiting magnitudes above 5, radiant elevation above 20 degrees, 
## percentage of clouds below 20
ori2015<-filter(rate2015,date.start="2015-10-21",date.end="2015-10-25",shw="ORI",
P.up=20,mag.low=5,mag.up=8,h.low=20)
opt.bin(ori2015,date.start="2015-10-21",date.end="2015-10-25",shw="ORI",
kmin=0.16,kmax=1,num=100)



