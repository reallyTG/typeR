library(ccfa)


### Name: localIGE
### Title: localIGE
### Aliases: localIGE

### ** Examples

data(igm)
igm$hs=ifelse(igm$HEDUC=="HS",1,0)
igm$col=ifelse(igm$HEDUC=="COL",1,0)
formla=lcfincome~lfincome
xformla=~hs+col
tvals=seq(quantile(igm$lfincome,probs = 0.1),quantile(igm$lfincome,probs = 0.9),length.out = 10)
h=1.2
cl=1
data=igm
localIGE(formla=formla, xformla=xformla, data=data,tvals=tvals,h=h,cl=cl)



