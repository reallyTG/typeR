library(carcass)


### Name: persistence.prob
### Title: Estimates carcass persistence probability based on carcass
###   removal experiment data
### Aliases: persistence.prob
### Keywords: methods misc

### ** Examples

data(persistence)
persistence.prob(persistence$turbineID, persistence$perstime, persistence$status)
persistence.prob(persistence$turbineID, persistence$perstime, persistence$status, 
    pers.const=TRUE)



