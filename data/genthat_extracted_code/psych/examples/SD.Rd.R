library(psych)


### Name: SD
### Title: Find the Standard deviation for a vector, matrix, or data.frame
###   - do not return error if there are no cases
### Aliases: SD
### Keywords: models

### ** Examples

data(attitude)
apply(attitude,2,sd) #all complete
attitude[,1] <- NA
SD(attitude) #missing a column
describe(attitude)



