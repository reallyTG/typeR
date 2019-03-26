library(PhysicalActivity)


### Name: sumVct
### Title: Summarize Wear and Nonwear Time Interval
### Aliases: sumVct

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

sumVct(data1m, id="sdata1m")
sumVct(data1m, id="sdata1m", markingString = "nw")



