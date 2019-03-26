library(PET)


### Name: viewData
### Title: Display Several Images.
### Aliases: viewData
### Keywords: print

### ** Examples

P <- phantom()
R <- markPoisson(P)
viewData(list(P, R$Data, R$rData), list("Phantom", 
         "Marked Poisson Data", "Simulated PET Data"))
rm(P,R)



