library(DGM)


### Name: dlm.lpl
### Title: Calculate the log predictive likelihood for a specified set of
###   parents and a fixed delta.
### Aliases: dlm.lpl

### ** Examples

data("utestdata")
Yt = myts[,1]
Ft = t(cbind(1,myts[,2:5]))
m = dlm.lpl(Yt, Ft, 0.7)





