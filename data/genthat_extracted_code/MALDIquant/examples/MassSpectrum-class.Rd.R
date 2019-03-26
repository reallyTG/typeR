library(MALDIquant)


### Name: MassSpectrum-class
### Title: Class "MassSpectrum"
### Aliases: MassSpectrum MassSpectrum-class isRegular
###   isRegular,MassSpectrum-method totalIonCurrent
###   totalIonCurrent,MassSpectrum-method
### Keywords: classes

### ** Examples

## load package
library("MALDIquant")

## create a MassSpectrum object by default constructor
s <- createMassSpectrum(mass=1:100, intensity=rnorm(100)^2,
                        metaData=list(name="example"))

## show some details
s

## plot spectrum
plot(s)

## get TIC
totalIonCurrent(s)

## modify intensity and metaData
intensity(s)[1:50] <- 0
metaData(s) <- list(name="modified example")

## plot again
plot(s)



