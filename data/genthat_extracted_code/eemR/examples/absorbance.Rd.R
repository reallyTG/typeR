library(eemR)


### Name: absorbance
### Title: CDOM absorbance data.
### Aliases: absorbance
### Keywords: datasets

### ** Examples


data("absorbance")

plot(absorbance$wavelength, absorbance$sample1, type = "l",
xlab = "Wavelengths", ylab = "Absorbance per meter")
lines(absorbance$wavelength, absorbance$sample2, col = "blue")
lines(absorbance$wavelength, absorbance$sample3, col = "red")



