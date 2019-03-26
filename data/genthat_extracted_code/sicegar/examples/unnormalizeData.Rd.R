library(sicegar)


### Name: unnormalizeData
### Title: Unnormalization of given data
### Aliases: unnormalizeData

### ** Examples

# generateRandomData
time <- seq(3, 48, 0.5)
intensity <- runif(length(time), 3.0, 7.5)
dataInput <- data.frame(time, intensity)
# Normalize Data
dataOutput <- normalizeData(dataInput)
dataInput2 <- dataOutput
# Un Normalize it
dataOutput2 <- unnormalizeData(dataInput2)




