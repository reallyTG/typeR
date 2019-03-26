library(autoimage)


### Name: reset.par
### Title: Reset par
### Aliases: reset.par

### ** Examples

par("mar") #current values of mar
par(mar = c(0, 0, 0, 0)) # change values of mar
par("mar") # changed values of mar
reset.par() # reset to defaults (not necessarilly current values)
par("mar") # should be c(5.1, 4.1, 4.1, 2.1)



