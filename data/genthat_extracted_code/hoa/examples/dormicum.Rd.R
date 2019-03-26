library(hoa)


### Name: dormicum
### Title: Dormicum Data
### Aliases: dormicum
### Keywords: datasets

### ** Examples

data(dormicum)
par(mfrow = c(1,2))
plot(dose ~ symp, data = dormicum, xlab = "presence of withdrawal symptoms",
     ylab = "treatment dose (mg/kg)")
plot(days ~ symp, data = dormicum, xlab = "presence of withdrawal symptoms",
     ylab = "treatment days")



