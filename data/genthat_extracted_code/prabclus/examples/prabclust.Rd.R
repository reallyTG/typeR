library(prabclus)


### Name: prabclust
### Title: Clustering for biotic elements or for species delimitation
###   (mixture method)
### Aliases: prabclust print.prabclust
### Keywords: cluster spatial

### ** Examples

## No test: 
# Biotic element/range clustering:
data(kykladspecreg)
data(nb)
set.seed(1234)
x <- prabinit(prabmatrix=kykladspecreg, neighborhood=nb)
# If you want to use your own ASCII data files, use
# x <- prabinit(file="path/prabmatrixfile",
# neighborhood="path/neighborhoodfile")
print(prabclust(x))

# Here is an example for species delimitation with codominant markers;
# only 50 individuals were used in order to have a fast example. 
data(tetragonula)
ta <- alleleconvert(strmatrix=tetragonula[1:50,])
tai <- alleleinit(allelematrix=ta)
print(prabclust(tai))

# Here is an example for species delimitation with dominant markers;
# only 50 individuals were used in order to have a fast example.
# You may want to use stressvals to choose mdsdim.
data(veronica)
vei <- prabinit(prabmatrix=veronica[1:50,],distance="jaccard")
print(prabclust(vei,mdsmethod="kruskal",mdsdim=3))
## End(No test)



