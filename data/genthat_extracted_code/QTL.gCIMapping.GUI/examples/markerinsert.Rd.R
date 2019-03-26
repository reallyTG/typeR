library(QTL.gCIMapping.GUI)


### Name: markerinsert
### Title: To insert marker in genotype.
### Aliases: markerinsert

### ** Examples

mp=matrix(c(197.9196,198.7536,199.5876,200.4216,201.2453,
202.0691,202.8928,203.7521,204.6113,205.4706,206.3298,207.1891,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,3,3,3,3,3,3,
1,1,1,2,2,2,3,3,3,3,3,3,1,2,3,4,5,6,7,8,9,10,11,12),12,5)
map=matrix(c(1,1,1,1,197.9196,200.4216,202.8928,207.1891),4,2)
geno=matrix(c(1,99,99,99),1,4)
QTL.gCIMapping.GUI::markerinsert(mp,geno,map,cl=1,gg1=1,gg2=-1,gg0=99,flagRIL=1)




