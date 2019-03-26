library(kulife)


### Name: greenland
### Title: Average yearly summer air temperature for Tasiilaq, Greenland
### Aliases: greenland
### Keywords: datasets

### ** Examples

data(greenland)
model <- lm(airtemp ~ year, data=greenland)
plot(greenland$year, greenland$airtemp, xlab="Year", ylab="Air temperature")
abline(model, col="red")



