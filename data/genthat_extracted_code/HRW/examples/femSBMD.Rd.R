library(HRW)


### Name: femSBMD
### Title: Female spinal bone mineral densities
### Aliases: femSBMD

### ** Examples

library(HRW) ; data(femSBMD)
if (require("lattice"))
   print(xyplot(spnbmd ~ age|factor(ethnicity),groups = idnum,
                data = femSBMD,type = "b"))



