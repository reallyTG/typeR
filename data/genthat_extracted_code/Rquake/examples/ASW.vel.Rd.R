library(Rquake)


### Name: ASW.vel
### Title: 1D Velocity Ecuador
### Aliases: ASW.vel LITHOS.vel StHelens4.vel fuj1.vel jap1.vel
###   montserat.vel wu_coso.vel
### Keywords: datasets

### ** Examples


data(ASW.vel)
data(wu_coso.vel)
data(fuj1.vel)
data(LITHOS.vel)

RSEIS::Comp1Dvels(c("ASW.vel","wu_coso.vel",  "fuj1.vel" , "LITHOS.vel"  ))





