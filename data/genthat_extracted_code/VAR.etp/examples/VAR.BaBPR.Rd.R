library(VAR.etp)


### Name: VAR.BaBPR
### Title: Bootstrap-after-Bootstrap Prediction Intervals for VAR(p) Model
### Aliases: VAR.BaBPR
### Keywords: ts

### ** Examples

data(dat)
VAR.BaBPR(dat,p=2,h=10,nboot=200,nb=100,type="const",alpha=0.95)
# nboot and nb are set to low numbers for fast execution in the example
# In actual implementation, use higher numbers such as nboot=1000, nb=200



