library(FactoClass)


### Name: ward.cluster
### Title: Hierarchic Classification by Ward's Method
### Aliases: ward.cluster
### Keywords: multivariate hplot

### ** Examples

data(ardeche)
ca <- dudi.coa(ardeche$tab,scannf=FALSE,nf=4)

 ward.cluster( dista= dist(ca$li), peso=ca$lw )

 dev.new()
 HW <- ward.cluster( dista= dist(ca$li), peso=ca$lw ,h.clust = 1)
 plot(HW)
 rect.hclust(HW, k=4, border="red")




