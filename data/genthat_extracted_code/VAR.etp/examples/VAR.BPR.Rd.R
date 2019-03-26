library(VAR.etp)


### Name: VAR.BPR
### Title: Bootstrap Prediction Intervals for VAR(p) Model
### Aliases: VAR.BPR
### Keywords: ts

### ** Examples

data(dat)
VAR.BPR(dat,p=2,h=10,nboot=200,type="const",alpha=0.95)
# nboot is set to a low number for fast execution in the example
# In actual implementation, use higher number such as nboot=1000



