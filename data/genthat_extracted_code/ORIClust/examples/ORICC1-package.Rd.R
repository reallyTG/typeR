library(ORIClust)


### Name: ORICC1
### Title: One-stage ORICC
### Aliases: ORICC1
### Keywords: package

### ** Examples

data(Breast)
ORICC1(Breast,data.col=3:50,id.col=1,n.rep=rep(8,6),
       n.top=50,transform=1,name.profile="all",plot.format="eps")



