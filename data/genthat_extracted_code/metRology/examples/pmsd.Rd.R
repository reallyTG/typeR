library(metRology)


### Name:  pmsd 
### Title: Median scaled difference probabilities and quantiles
### Aliases: ' pmsd ' ' qmsd ' ' dmsd '
### Keywords: distribution

### ** Examples


  data(Pb)
  msd(Pb$value)          # Uses mad(Pb$value) as scale estimate
  msd(Pb$value, Pb$u)    # Scales differences using standard uncertainties




