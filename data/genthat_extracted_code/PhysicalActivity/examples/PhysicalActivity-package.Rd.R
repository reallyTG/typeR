library(PhysicalActivity)


### Name: PhysicalActivity-package
### Title: Process Accelerometer Data for Physical Activity Measurement
### Aliases: PhysicalActivity PhysicalActivity-package
### Keywords: accelerometer and classification classification, data day
###   delivery mail nonwear process, wear

### ** Examples

data(dataSec)

mydata1m = dataCollapser(dataSec, TS = "TimeStamp", col = "counts", by = 60)
options(pa.cts = 'counts') # change cnt variable from "axis1" to "counts"
data1m = wearingMarking(dataset = mydata1m, frame = 90)

sumVct(data1m, id="sdata1m")

plotData(data=data1m)

summaryData(data=data1m, validCut=600, perMinuteCts=1, markingString = "w")



