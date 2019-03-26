library(FactoClass)


### Name: plotFactoClass
### Title: Factorial Planes Showing the Classes
### Aliases: plotFactoClass
### Keywords: multivariate cluster hplot

### ** Examples



data(Bogota)
Bog.act <- Bogota[-1]
Bog.ilu <- Bogota[ 1]

FC.Bogota<-FactoClass(Bog.act, dudi.coa,Bog.ilu,nf=2,nfcl=5,k.clust=5,scanFC=FALSE)

plotFactoClass(FC.Bogota,titre="First Factorial Plane from the SCA of Bogota's Blocks",
     col.row=c("maroon2","orchid4","darkgoldenrod2","dark red","aquamarine4"))




