library(medflex)


### Name: neWeight.formula
### Title: Expand the dataset and calculate ratio-of-mediator probability
###   weights
### Aliases: neWeight.formula

### ** Examples

data(UPBdata)

## example using glm
weightData <- neWeight(negaff ~ att + gender + educ + age, 
                       data = UPBdata, nRep = 2)



