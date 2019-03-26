library(metRology)


### Name:  msd 
### Title: Median scaled difference
### Aliases: ' msd '
### Keywords: univar

### ** Examples


  data(Pb)
  msd(Pb$value)  # Uses mad(Pb$value) as scale estimate
  msd(Pb$value, Pb$u)  # Scales differences using standard uncertainties




