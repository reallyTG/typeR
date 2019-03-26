library(agricolae)


### Name: index.AMMI
### Title: AMMI index and yield stability
### Aliases: index.AMMI
### Keywords: models

### ** Examples

library(agricolae)
# Index AMMI
data(plrv)
model<- with(plrv,AMMI(Locality, Genotype, Rep, Yield, console=FALSE))
Idx<-index.AMMI(model)
names(Idx)
# Crops with improved stability according AMMI.
print(Idx[order(Idx[,3]),])
# Crops with better response and improved stability according AMMI.
print(Idx[order(Idx[,4]),])



