library(sicegar)


### Name: normalizeData
### Title: Normalization of given data
### Aliases: normalizeData

### ** Examples

# generateRandomData
time <- seq(3, 48, 0.5)
intensity <- runif(length(time), 3.0, 7.5)
dataInput <- data.frame(time, intensity)

# Normalize Data
dataOutput <- normalizeData(dataInput, dataInputName="sample001")




