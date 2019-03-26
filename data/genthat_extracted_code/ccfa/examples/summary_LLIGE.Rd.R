library(ccfa)


### Name: summary_LLIGE
### Title: summary_LLIGE
### Aliases: summary_LLIGE

### ** Examples

data(igm)
igm$hs=ifelse(igm$HEDUC=="HS",1,0)
igm$col=ifelse(igm$HEDUC=="COL",1,0)
formla=lcfincome~lfincome
xformla=~hs+col
tvals=seq(quantile(igm$lfincome,probs = 0.1),quantile(igm$lfincome,probs = 0.9),length.out = 10)
h=1.2
data=igm
B=7
cl=1
object=LLIGE(B,formla=formla, xformla=xformla, data=data,tvals=tvals,h=h,cl=cl)
summary_LLIGE(object)



