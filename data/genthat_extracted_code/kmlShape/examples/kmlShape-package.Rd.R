library(kmlShape)


### Name: kmlShape-package
### Title: ~ Package: kmlShape ~
### Aliases: kmlShape-package
### Keywords: package

### ** Examples

## No test: 
#########
### Real example, on ictus data

### Preparing the data
set.seed(1)
data(ictusShort)
myClds <- cldsWide(ictusShort)

### Reducing the data size
reduceTraj(myClds,nbSenators=64,nbTimes=5)

### Clustering using shape
kmlShape(myClds,4)

plotMeans(myClds)
## End(No test)



