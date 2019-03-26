library(effectsizescr)


### Name: TAU
### Title: Parker's TAU-U
### Aliases: TAU

### ** Examples

data=cbind(rnorm(16),1:16,c(rep(0,8),rep(1,8)))
colnames(data)=c("DV","TIME","PHASE")
TAU(data1=data,nameTime = "TIME",namePhase = "PHASE",
nameDV = "DV")



