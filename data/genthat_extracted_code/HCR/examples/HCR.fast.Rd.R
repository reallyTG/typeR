library(HCR)


### Name: HCR.fast
### Title: The Fast Version for Fitting Hidden Compact Representation Model
### Aliases: HCR.fast

### ** Examples

library(data.table)
set.seed(1)
data=simuXY(sample_size=2000)
r1=HCR.fast(data$X,data$Y)
r2=HCR.fast(data$Y,data$X)
# The canonical hidden representation
unique(r1$data[,c("X","Yp")])
# The recovery of hidden representation
unique(data.frame(data$X,data$Yp))




