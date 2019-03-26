library(trimr)


### Name: sdTrim
### Title: RT trimming with standard deviation criterion
### Aliases: sdTrim

### ** Examples

# load the example data that ships with trimr
data(exampleData)

# perform the trimming with SD trimming per condition, returning mean RT
trimmedData <- sdTrim(data = exampleData, minRT = 150, sd = 2.5,
perCondition = TRUE, perParticipant = FALSE, returnType = "mean")



