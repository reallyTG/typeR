library(PhysicalActivity)


### Name: wearingMarking
### Title: Classify Wear and Nonwear Time for Accelerometer Data
### Aliases: wearingMarking

### ** Examples

data(dataSec)

## mark data with 1-min epoch
mydata1m = dataCollapser(dataSec, TS = "TimeStamp", col = "counts", by = 60)

data1m = wearingMarking(dataset = mydata1m,
                       frame = 90, 
                       perMinuteCts = 1,
                       TS = "TimeStamp",
                       cts = "counts", 
                       streamFrame = NULL, 
                       allowanceFrame= 2, 
                       newcolname = "wearing")

sumVct(data1m, id="dataid")

## mark data with 1-sec epoch
## Not run: 
##D data1s = wearingMarking(dataset = dataSec,
##D                        frame = 90, 
##D                        perMinuteCts = 60,
##D                        TS = "TimeStamp",
##D                        cts = "counts", 
##D                        streamFrame = NULL, 
##D                        allowanceFrame= 2, 
##D                        newcolname = "wearing",
##D                        getMinuteMarking = FALSE)
##D 
##D sumVct(data1s, id="dataid")
##D sumVct(data1s, id="dataid", markingString = "nw")
## End(Not run)



