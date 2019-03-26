library(trimr)


### Name: absoluteRT
### Title: Absolute RT trimming
### Aliases: absoluteRT

### ** Examples

# load the example data that ships with trimr
data(exampleData)

# perform the trimming, returning mean RT
trimmedData <- absoluteRT(data = exampleData, minRT = 150, maxRT = 2500,
returnType = "mean")



