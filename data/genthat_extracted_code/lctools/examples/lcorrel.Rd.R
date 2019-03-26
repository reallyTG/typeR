library(lctools)


### Name: lcorrel
### Title: Local Pearson and GW Pearson Correlation
### Aliases: lcorrel
### Keywords: LPCC GWPCC local multi-collinearity

### ** Examples

data(VotesGR)
local.cor<-lcorrel(VotesGR[5:6],0.1,cbind(VotesGR$X, VotesGR$Y))
plot(local.cor$LPCC[,2],local.cor$GWPCC[,2])



