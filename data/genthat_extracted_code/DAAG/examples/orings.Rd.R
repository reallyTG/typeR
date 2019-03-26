library(DAAG)


### Name: orings
### Title: Challenger O-rings Data
### Aliases: orings
### Keywords: datasets

### ** Examples

oldpar <- par(mfrow=c(1,2))
plot(Total~Temperature, data = orings[c(1,2,4,11,13,18),]) # the 
               # observations included in the pre-launch charts
plot(Total~Temperature, data = orings)
par(oldpar)



