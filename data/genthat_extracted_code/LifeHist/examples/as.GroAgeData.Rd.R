library(LifeHist)


### Name: as.GroAgeData
### Title: Create a Data Object to Fit Individual Growth Models with
###   Age-Length Observations
### Aliases: as.GroAgeData
### Keywords: ~manip

### ** Examples

data(ksbream)
KSBream.AgeLen <- as.GroAgeData(x=ksbream,
                                sex="Total",
                                maleskey=1,
                                femaleskey=2,
                                coldate=1,
                                colsex=9,
                                colage=11,
                                collen=2,
                                colbw=5,
                                colliver=7,
                                colgonad=8,
                                lentype="Total",
                                unitsage="Years",
                                unitslen="mm",
                                unitsbw="g",
                                unitsliver="g",
                                unitsgonad="g",
                                spec="KSBream")
plot(KSBream.AgeLen)



