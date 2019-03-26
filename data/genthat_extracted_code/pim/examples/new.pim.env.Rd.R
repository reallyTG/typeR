library(pim)


### Name: new.pim.env
### Title: Constructor for a pim.environment
### Aliases: new.pim.env new.pim.env,missing-method
###   new.pim.env,environment-method new.pim.env,list-method
###   new.pim.env,data.frame-method new.pim.env,ANY-method

### ** Examples

new.pim.env() # Creates an empty object

# Starting from a data frame
data(DysData)
env1 <- new.pim.env(DysData)

env2 <- new.pim.env(DysData, compare=NULL)
poset(env2)
env3 <- new.pim.env(DysData, compare="all")
poset(env3)


data(FEVData)
env4 <- new.pim.env(FEVData, vars=c('Age','Sex'))
ls(env4)





