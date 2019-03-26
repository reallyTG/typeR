library(PhysicalActivity)


### Name: summaryData
### Title: Summarize Classified Wear Time by Daily Basis
### Aliases: summaryData

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

summaryData(data=data1m, validCut=600, perMinuteCts=1, markingString = "w", cts = "counts")

data(deliveryData)
options(pa.cts = "vm")
wm <- wearingMarking(dataset = deliveryData)
dd <- markDelivery(wm)
summaryData(wm, delivery = dd)

pai.data <- markPAI(data = wm)
dd <- markDelivery(pai.data)
summaryData(pai.data, delivery = dd)




