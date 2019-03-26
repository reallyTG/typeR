library(sicegar)


### Name: dataCheck
### Title: Checks if data is in correct format.
### Aliases: dataCheck

### ** Examples


# Example 1

# generate data frame
time <- seq(3, 48, 0.5)
intensity <- runif(length(time), 3.0, 7.5)
dataInput <- data.frame(time, intensity)

# Apply dataCheck function
dataOutputVariable <- dataCheck(dataInput)

# Example 2

# generate data frame
time <- seq(3, 48, 0.5)
intensity <- runif(length(time), 3.0, 7.5)
dataInput <- data.frame(time, intensity)

# Normalize Data
dataOutput <- normalizeData(dataInput)
dataInput2 <- dataOutput

# Apply dataCheck function
dataOutputVariable2 <- dataCheck(dataInput2)



