library(HRW)


### Name: BCR
### Title: Berry, Carroll and Ruppert (2002) data
### Aliases: BCR

### ** Examples

library(HRW) ; data(BCR)
if (require("lattice")) 
   print(xyplot(y ~ w|status,data = BCR))



