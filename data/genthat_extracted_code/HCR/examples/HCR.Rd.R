library(HCR)


### Name: HCR
### Title: Hidden Compact Representation Model
### Aliases: HCR

### ** Examples

library(data.table)
set.seed(10)
data=simuXY(sample_size=200)
r1<-HCR(data$X,data$Y)
r2<-HCR(data$Y,data$X)
# The canonical hidden representation
unique(r1$data[,c("X","Yp")])
# The recovery of hidden representation
unique(data.frame(data$X,data$Yp))




