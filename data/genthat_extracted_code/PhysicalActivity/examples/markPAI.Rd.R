library(PhysicalActivity)


### Name: markPAI
### Title: Mark Physical Activity Intensity (PAI) Level
### Aliases: markPAI

### ** Examples

data(dataSec)

mydata1m = dataCollapser(dataSec, TS = "TimeStamp", col = "counts", by = 60)

data1m = wearingMarking(dataset = mydata1m,
                       perMinuteCts = 1,
                       cts = "counts")

markPAI(data = data1m, cts = 'counts')[1:10,]



