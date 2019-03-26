library(sdcMicro)


### Name: microData
### Title: microData
### Aliases: microData
### Keywords: datasets

### ** Examples


data(microData)
microData <- as.data.frame(microData)
m1 <- microaggregation(microData, method="mdav")
summary(m1)




