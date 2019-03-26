library(colourvision)


### Name: bee
### Title: Honeybee photoreceptors
### Aliases: bee
### Keywords: datasets

### ** Examples

data("bee")
plot(bee[,2]~bee[,1], col = "violet", type="l", xlab="Wavelength(nm)", ylab= "Absorbance")
lines(bee[,3]~bee[,1], col = "blue", type="l")
lines(bee[,4]~bee[,1], col = "green", type="l")



