library(PAWL)


### Name: smcparameters
### Title: SMC Tuning Parameters
### Aliases: smcparameters-class smcparameters smcparameters,ANY-method
###   show,smcparameters-method
### Keywords: classes

### ** Examples

showClass("smcparameters")
smcparam<- smcparameters(nparticles=5000, 
                        temperatures = seq(from = 0.0001, to = 1, length.out= 100),
                        nmoves = 5, ESSthreshold = 0.5, movetype = "randomwalk",
                        movescale = 0.1)



