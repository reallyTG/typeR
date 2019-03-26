library(PBImisc)


### Name: eden
### Title: European day hospital evaluation
### Aliases: eden
### Keywords: eden

### ** Examples

data(eden)
library(lattice)
xyplot(BPRS.Average~MANSA|center, data=eden, type=c("p","g","smooth"))



