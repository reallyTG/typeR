library(MetFns)


### Name: zhr.plot
### Title: Plot of zenithal hourly rate (ZHR)
### Aliases: zhr.plot

### ** Examples

## calculate and make plot of ZHR for observations of 2015 Perseids, time period
## around maximum, 21th to 25th October, min bin size 0.16 degrees (4 hours), 
## max bin size 1 degree, number of meteors equals 100 
## First select rate data for Orionids activity from 21th to 25th October, 
## limiting magnitudes above 5, radiant elevation above 20 degrees, 
## percentage of clouds below 20
ori2015<-filter(rate2015,date.start="2015-10-21",date.end="2015-10-25",shw="ORI",
P.up=20,mag.low=5,h.low=20)
orizhr<-zhr(ori2015,date.start="2015-10-21",date.end="2015-10-25",shw="ORI",
r=2.5,kmin=0.16,kmax=1,num=100)

## make graphic of ZHR
## x-axis limits: min(sollong)=207.137, max(sollong)=210.276
## y-axis limits: min(ZHR-st.err)=14.2,max(ZHR+st.err)=21.9
zhr.plot(orizhr,xlim1=207,xlim2=211,xinc=1,ylim1=14,ylim2=22,yinc=1)

## change date tick marks on secondary x-axis, to show date at midnight
 zhr.plot(orizhr,xlim1=207,xlim2=211,xinc=1,ylim1=14,ylim2=22,yinc=1,
 dlim1="2015-10-21",dlim2="2015-10-25",dinc=1,dunit="day")




