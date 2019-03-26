library(ArArRedux)


### Name: fractionation
### Title: Compute the mass fractionation correction
### Aliases: fractionation

### ** Examples

data(Melbourne)
fd37file <- system.file("AirL2.csv",package="ArArRedux")
fd40file <- system.file("AirH1.csv",package="ArArRedux")
fract <- list(fractionation(fd37file,"L2",PH=TRUE),
              fractionation(fd40file,"H1",PH=FALSE))
if (isTRUE(all.equal(Melbourne$fract,fract))){
  print("We just re-created the fractionation correction for the Melbourne dataset")
}



