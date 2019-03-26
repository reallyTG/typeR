library(ORIClust)


### Name: ORICC2
### Title: Two-stage ORICC
### Aliases: ORICC2
### Keywords: package

### ** Examples


data(Breast)
ORICC2(Breast,data.col=3:50,id.col=1,n.rep=rep(8,6),
       n.top=50,transform=1,name.profile="all",plot.format="eps")



