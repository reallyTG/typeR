## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- out.width = "600px", echo=FALSE------------------------------------
knitr::include_graphics("rstudio-IRISSeismic.png")

## ----first, results="hide"-----------------------------------------------
library(IRISSeismic)
iris <- new("IrisClient")

## ----second, fig.height=4, fig.width=5-----------------------------------
starttime <- as.POSIXct("2002-04-20", tz="GMT")
endtime <- as.POSIXct("2002-04-21", tz="GMT")
st <- getDataselect(iris,"US","OXF","","BHZ",starttime,endtime)
length(st@traces)
plotUpDownTimes(st, min_signal=1, min_gap=1)

## ----third---------------------------------------------------------------
getGaps(st)

## ----fourth--------------------------------------------------------------
parallelLength(st)
parallelMax(st)
parallelSd(st)

## ----fifth---------------------------------------------------------------
tr <- st@traces[[3]]
tr@stats

## ----sixth, fig.height=4, fig.width=6------------------------------------
plot(tr)

## ----seventh-------------------------------------------------------------
slotNames(st)

## ----eighth--------------------------------------------------------------
class(st@url)
class(st@requestedStarttime)
class(st@traces)

## ----ninth---------------------------------------------------------------
slotNames(st@traces[[1]])

## ----tenth---------------------------------------------------------------
as.POSIXct("2010-02-27", tz="GMT") # good
as.POSIXct("2010-02-27 04:00:00", tz="GMT") # good
as.POSIXct("2010-02-27T04:00:00", tz="GMT",
           format="%Y-%m-%dT%H:%M:%OS") # good

as.POSIXct("2010-02-27") # BAD -- no timezone
as.POSIXct("2010-02-27T04:00:00", tz="GMT") # BAD -- no formatting

## ----eleventh, results="hide"--------------------------------------------
help("IRISSeismic",package="IRISSeismic")

## ----twelfth,fig.height=8, fig.width=6-----------------------------------
starttime <- as.POSIXct("2010-02-27", tz="GMT")
endtime <- as.POSIXct("2010-02-28", tz="GMT")
st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)

start2 <- as.POSIXct("2010-02-27 06:40:00", tz="GMT")
end2 <- as.POSIXct("2010-02-27 07:40:00", tz="GMT")

tr1 <- st@traces[[1]]
tr2 <- slice(tr1, start2, end2)

layout(matrix(seq(2)))        # layout a 2x1 matrix
plot(tr1)
plot(tr2)
layout(1)                     # restore original layout

## ----thirteenth----------------------------------------------------------
starttime <- as.POSIXct("2002-04-20", tz="GMT")
endtime <- as.POSIXct("2002-04-21", tz="GMT")
st <- getDataselect(iris,"US","OXF","","BHZ",starttime,endtime)
tr <- st@traces[[3]]
picker <- STALTA(tr,3,30)
threshold <- quantile(picker,0.99999,na.rm=TRUE)
to <- triggerOnset(tr,picker,threshold)

## ----fourteenth, fig.height=12, fig.width=6------------------------------
layout(matrix(seq(3)))        # layout a 3x1 matrix
closeup1 <- eventWindow(tr,picker,threshold,3600)
closeup2 <- eventWindow(tr,picker,threshold,600)
plot(tr)
abline(v=to, col='red', lwd=2)
plot(closeup1)
abline(v=to, col='red', lwd=2)
plot(closeup2)
abline(v=to, col='red', lwd=2)
layout(1)                     # restore original layout

## ----fiftheenth----------------------------------------------------------
starttime <- as.POSIXct("2010-02-27", tz="GMT")
endtime <- as.POSIXct("2010-02-28", tz="GMT")
availability <- getAvailability(iris,"IU","ANMO","*","B??",starttime,endtime)
availability

## ----sixteenth, fig.height=4, fig.width=6--------------------------------
# Open a connection to IRIS DMC webservices
iris <- new("IrisClient")

# Two days around the "Nisqually Quake"
starttime <- as.POSIXct("2001-02-27", tz="GMT")
endtime <- starttime + 3600 * 24 *2

# Find biggest seismic event over these two days -- it's the "Nisqually"
events <- getEvent(iris, starttime, endtime, minmag=5.0)
bigOneIndex <- which(events$magnitude == max(events$magnitude))
bigOne <- events[bigOneIndex[1],]

# Find US stations that are available within 10 degrees of arc of the 
# event location during the 15 minutes after the event
start <- bigOne$time
end <- start + 900
av <- getAvailability(iris, "US", "", "", "BHZ", start, end,
                      latitude=bigOne$latitude, longitude=bigOne$longitude,
                      minradius=0, maxradius=10)
    
# Get the station the furthest East
minLonIndex <- which(av$longitude == max(av$longitude))
snclE <- av[minLonIndex,]

# Get travel times to this station
traveltimes <- getTraveltime(iris, bigOne$latitude, bigOne$longitude, bigOne$depth,
                             snclE$latitude, snclE$longitude)

# Look at the list                             
traveltimes

# Find the P and S arrival times
pArrival <- start + traveltimes$travelTime[traveltimes$phaseName=="P"]
sArrival <- start + traveltimes$travelTime[traveltimes$phaseName=="S"] 

# Get the BHZ signal for this station
st <- getDataselect(iris,snclE$network,snclE$station,
                    snclE$location,snclE$channel,
                    start,end)

# Check that there is only a single trace
length(st@traces)

# Plot the seismic trace and mark the "P" and "S" arrival times
tr <- st@traces[[1]]
plot(tr, subsampling=1) # need subsampling=1 to add vertical lines with abline()
abline(v=pArrival, col='red')
abline(v=sArrival, col='blue')


