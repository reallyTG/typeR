library(Luminescence)


### Name: calc_gSGC
### Title: Calculate De value based on the gSGC by Li et al., 2015
### Aliases: calc_gSGC
### Keywords: datagen

### ** Examples


results <- calc_gSGC(data = data.frame(
LnTn =  2.361, LnTn.error = 0.087,
Lr1Tr1 = 2.744, Lr1Tr1.error = 0.091,
Dr1 = 34.4))

get_RLum(results, data.object = "De")




