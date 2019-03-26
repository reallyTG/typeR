library(phytotools)


### Name: incident
### Title: Simulate photosynthetic active radiaton (PAR)
### Aliases: incident

### ** Examples


#Simulate cloud free PAR Lake Diefenbaker on 1 July 2013 using default Linke Turbidity
date <- seq(ISOdatetime(2013,7,1,0,0,0,tz="UTC"),
            ISOdatetime(2013,7,2,0,0,0,tz="UTC"),
            by="10 min")

LD.1 <- incident(date,50,-105,556,-8,reflectance=FALSE)

#Simulate cloud free PAR Lake Diefenbaker on 1 July 2013  Linke Turbidity of 4.5
LD.2 <- incident(date,50,-105,556,-8,TL=4.5,reflectance=FALSE)

#Now simulate PAR for Lake Diefenbaker using a mean PAR value of 578 umol m-2 s-1
LD.3 <- incident(date,50,-105,556,-8,meanPAR=575,reflectance=FALSE)

#Now simulate PAR for Lake Diefenbaker using a mean PAR value of 578 umol m-2 s-1
#and Link Turbidity of 4.5
LD.4 <- incident(date,50,-105,556,-8,meanPAR=575,TL=4.5,reflectance=FALSE)

#Compare simulations
plot(LD.1[,1],LD.1[,2],xlab="Day of year",ylab="PAR",type="l")
lines(LD.2[,1],LD.2[,2],col="red")
lines(LD.3[,1],LD.3[,2],col="blue")
lines(LD.4[,1],LD.4[,2],col="blue",lty=2)

#Simulate annual PAR for Lake Erie, with a workaround for daylight savings time
date1 <- seq(ISOdatetime(2013,1,1,0,0,0,tz="UTC"),
             ISOdatetime(2013,3,9,0,0,0,tz="UTC"),
             by="30 min")

date2 <- seq(ISOdatetime(2013,3,9,0,0,0,tz="UTC"),
             ISOdatetime(2013,11,2,0,0,0,tz="UTC"),
             by="30 min")

date3 <- seq(ISOdatetime(2013,11,2,0,0,0,tz="UTC"),
             ISOdatetime(2014,1,1,0,0,0,tz="UTC"),
             by="30 min")

LE <- rbind(incident(date1,42.15,-81,115,-5,reflectance=FALSE),
            incident(date2,42.15,-81,115,-4,reflectance=FALSE),
            incident(date3,42.15,-81,115,-5,reflectance=FALSE))

#plot data
plot(LE[,1],LE[,2],xlab="Day of year",ylab="PAR",type="l")




