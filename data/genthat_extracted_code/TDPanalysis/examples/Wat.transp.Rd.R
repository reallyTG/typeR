library(TDPanalysis)


### Name: Wat.transp
### Title: Calculate daily transpiration
### Aliases: Wat.transp

### ** Examples

ID = c(rep("A", times=5), rep("B", times=5), rep("A", times=5), rep("B", times=5))
Sapflow = c(rep(2.5, times=5), rep(2.7, times=5), rep(3.2, times=5), rep(3.4, times=5))
days = c(rep(102, times=10), rep(103, times=10))
Wat.transp(Sapflow=Sapflow, days=days, ID=ID)



