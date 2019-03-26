library(TempleMetrics)


### Name: llscm
### Title: llscm
### Aliases: llscm

### ** Examples

data(igm)
igm$hs=ifelse(igm$HEDUC=="HS",1,0)
igm$col=ifelse(igm$HEDUC=="COL",1,0)
formla=lcfincome~lfincome
xformla=~hs+col
t=mean(igm$lfincome)
h=1.2
data=igm
llscm(formla,xformla,data,t,h)



