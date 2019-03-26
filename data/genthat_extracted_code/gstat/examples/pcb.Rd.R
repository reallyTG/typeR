library(gstat)


### Name: pcb
### Title: PCB138 measurements in sediment at the NCP, the Dutch part of
###   the North Sea
### Aliases: pcb
### Keywords: datasets

### ** Examples

data(pcb)
library(lattice)
xyplot(y~x|as.factor(yf), pcb, aspect = "iso")
# demo(pcb)



