library(ccfa)


### Name: Plot_ALIGE
### Title: Plot_ALIGE
### Aliases: Plot_ALIGE

### ** Examples

data(igm)
igm$hs=ifelse(igm$HEDUC=="HS",1,0)
igm$col=ifelse(igm$HEDUC=="COL",1,0)
formla=lcfincome~lfincome
xformla=~hs+col
tvals=seq(quantile(igm$lfincome,probs = 0.1),quantile(igm$lfincome,probs = 0.9),length.out = 10)
h=1.2
data=igm
cl=1
B=7
ALIGE=localIGE(formla=formla, xformla=xformla, data=data,tvals=tvals,h=h,cl=cl)
sd_ALIGE=sdF(B,formla=formla, xformla=xformla, data=data,tvals=tvals,h=h)
Plot_ALIGE(tvals,ALIGE,sd_ALIGE,xlab="t",ylab="ALIGE",ylim=c(0,1))



