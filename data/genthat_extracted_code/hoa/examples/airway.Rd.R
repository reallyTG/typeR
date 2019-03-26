library(hoa)


### Name: airway
### Title: Airway Data
### Aliases: airway
### Keywords: datasets

### ** Examples

data(airway)
summary(airway)
par(mfrow=c(1,2))
plot(age ~ response, data = airway)
plot(duration ~ response, data = airway)



