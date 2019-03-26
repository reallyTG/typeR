library(PhysicalActivity)


### Name: dataCollapser
### Title: Collapse Accelerometer Data to a Dataset with a Longer Epoch
### Aliases: dataCollapser

### ** Examples

data(dataSec)

## collapse 1-sec epoch data to 10-sec epoch data
mydata10s = dataCollapser(dataSec, TS = "TimeStamp", col = "counts", by = 10)

## collapse 1-sec epoch data to 1-min epoch data
mydata1m = dataCollapser(dataSec, TS = "TimeStamp", col = "counts", by = 60)



