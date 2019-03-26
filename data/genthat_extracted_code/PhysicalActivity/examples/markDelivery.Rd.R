library(PhysicalActivity)


### Name: markDelivery
### Title: Classify Mail Delivery and Non-Delivery Days for Accelerometer
###   Data
### Aliases: markDelivery

### ** Examples

data(deliveryData)

options(pa.cts = "vm")
wm <- wearingMarking(dataset = deliveryData)

markDelivery(wm)
plotData(data=wm) # days 1, 2, 10 - 15 are delivery or invalid days based on the result above
markDelivery(wm, window='valid', method='mean')
markDelivery(wm, method='mean')
markDelivery(wm, method='sd')



