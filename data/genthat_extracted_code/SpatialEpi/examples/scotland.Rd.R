library(SpatialEpi)


### Name: scotland
### Title: Lip Cancer in Scotland
### Aliases: scotland
### Keywords: datasets

### ** Examples

data(scotland)
data <- scotland$data
scotland.map <- scotland$spatial.polygon

SMR <- data$cases/data$expected
mapvariable(SMR,scotland.map)



