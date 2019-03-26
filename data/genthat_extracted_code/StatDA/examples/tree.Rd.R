library(StatDA)


### Name: tree
### Title: Plot Trees
### Aliases: tree
### Keywords: tree multivariate

### ** Examples

data(ohorizon)
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]
el=log10(ohorizon[,c("Co","Cu","Ni","Rb","Bi","Na","Sr")])
sel <- c(3,8,22, 29, 32, 35, 43, 69, 73 ,93,109,129,130,134,168,181,183,205,211,
      218,237,242,276,292,297,298,345,346,352,372,373,386,408,419,427,441,446,490,
      516,535,551,556,558,564,577,584,601,612,617)
x=el[sel,]

tree(x,key.loc=c(15,0),len=0.022, lh=30,leglh=4,
    wmax=120,wmin=30, leglen=0.05, ncol=8, cex=0.75)



