library(FAMoS)


### Name: random.init.model
### Title: Generate Random Starting Model
### Aliases: random.init.model

### ** Examples

#set critical conditions
crits <- list(c(1,2,3), c(4,5))
#generate random model
random.init.model(number.par = 20)
random.init.model(number.par = 20, crit.parms = crits)



