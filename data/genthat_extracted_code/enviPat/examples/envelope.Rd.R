library(enviPat)


### Name: envelope
### Title: Isotope pattern envelope calculation
### Aliases: envelope

### ** Examples


############################
# batch of chemforms #######
data(isotopes)
data(chemforms)
chemforms<-chemforms[1:5]

pattern<-isopattern(
  isotopes,
  chemforms,
  threshold=0.1,
  plotit=TRUE,
  charge=FALSE,
  emass=0.00054858,
  algo=2
)

profiles<-envelope(
    pattern,
    ppm=FALSE,
    dmz=0.0001,   
    frac=1/4,
    env="Gaussian",
    resolution=1E6,
    plotit=TRUE
)
############################




