library(sparr)


### Name: fmd
### Title: Veterinary foot-and-mouth disease outbreak data
### Aliases: fmd
### Keywords: data

### ** Examples


data(fmd)
summary(fmd$cases)
summary(fmd$controls)
 
par(mfrow=c(1,2))
plot(fmd$cases)
plot(fmd$controls)




