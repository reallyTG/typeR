library(modTurPoint)


### Name: modTurPoint
### Title: Modified Turning Point Method for ED50 Estimation
### Aliases: modTurPoint

### ** Examples

library(modTurPoint)
dose1 <- c(3.1, 3.2, 3.3, 3.2, 3.1, 3.2, 3.3, 3.2, 3.3)
modTurPoint(doseSeries = dose1, confidence = 0.9)
dose2 <- c(3.25, 3.15, 3.25, 3.25)
modTurPoint(doseSeries = dose2, onlyTurPoint = TRUE, confidence = 0.9)



