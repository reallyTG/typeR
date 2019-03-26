library(MALDIquant)


### Name: AbstractMassObject-class
### Title: Class "AbstractMassObject"
### Aliases: AbstractMassObject-class
###   [,AbstractMassObject,logical,missing-method
###   [,AbstractMassObject,numeric,missing-method
###   [,MassPeaks,logical,missing-method [,MassPeaks,numeric,missing-method
###   as.matrix,AbstractMassObject-method intensity intensity<-
###   intensity,AbstractMassObject-method
###   intensity<-,AbstractMassObject,numeric-method isEmpty
###   isEmpty,AbstractMassObject-method length,AbstractMassObject-method
###   lines,AbstractMassObject-method mass mass<-
###   mass,AbstractMassObject-method
###   mass<-,AbstractMassObject,numeric-method mz mz<-
###   mz,AbstractMassObject-method mz<-,AbstractMassObject,numeric-method
###   metaData metaData<- metaData,AbstractMassObject-method
###   metaData<-,AbstractMassObject-method coordinates coordinates<-
###   coordinates,AbstractMassObject-method
###   coordinates<-,AbstractMassObject,numeric-method
###   coordinates<-,AbstractMassObject,matrix-method
###   coordinates,list-method coordinates<-,list,matrix-method
###   points,AbstractMassObject-method
### Keywords: classes

### ** Examples

## load package
library("MALDIquant")

## create example spectrum
s <- createMassSpectrum(mass=1:10, intensity=11:20,
                        metaData=list(name="Example Spectrum"))

## get intensity
intensity(s)

## get mass
mass(s)

## get metaData
metaData(s)

## replace metaData
metaData(s) <- list(name="Spectrum")

## trim spectrum
trim(s, c(2, 9))

## select a range
s[3:6]



