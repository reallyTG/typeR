library(delt)


### Name: eval.bagg
### Title: Returns a bootstrap aggregation of adaptive histograms
### Aliases: eval.bagg
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=600,seed=5,type="mulmodII")

leaf<-7     # number of leaves in the histograms
seed<-1     # seed for choosing bootstrap samples
sample="worpl" # without-replacement bootstrap
prune="on"  # we use CART-histograms
B<-5        # the number of histograms in the average

eva<-eval.bagg(dendat,B,leaf,seed=seed,sample=sample,prune=prune)

dp<-draw.pcf(eva,pnum=c(60,60))
persp(dp$x,dp$y,dp$z,theta=-20,phi=30)




