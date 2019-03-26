library(PhysicalActivity)


### Name: plotData
### Title: Plot Accelerometer Data over Time
### Aliases: plotData

### ** Examples

data(dataSec)

mydata1m = dataCollapser(dataSec, TS = "TimeStamp", col = "counts", by = 60)

data1m = wearingMarking(dataset = mydata1m,
                       frame = 90, 
                       perMinuteCts = 1,
                       TS = "TimeStamp",
                       cts = "counts", 
                       streamFrame = NULL, 
                       allowanceFrame= 2, 
                       newcolname = "wearing")

## change "cts" default from "axis1" to "counts"
options(pa.cts = "counts")
## plot the whole data
plotData(data=data1m)

## plot the data from 60 min to 900 min
plotData(data=data1m, start=60, end=900)

## plot the data for day 2
plotData(data=data1m, day=2)

## include summaryData
sumdat <- summaryData(data=data1m)
plotData(data=data1m, summary=sumdat)

## present daylight saving time change
data(deliveryData)
options(pa.cts = "vm")
wm <- wearingMarking(dataset = deliveryData, TS="TimeStamp", tz="America/Chicago")
sumdat <- summaryData(wm)
plotData(data=wm, summary = sumdat)
## valid data after delivery marking
del <- markDelivery(wm)
sumdat <- summaryData(wm, delivery = del)
plotData(data=wm, summary = sumdat)



