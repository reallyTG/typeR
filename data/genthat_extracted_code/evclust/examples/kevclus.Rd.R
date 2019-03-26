library(evclust)


### Name: kevclus
### Title: k-EVCLUS algorithm
### Aliases: kevclus

### ** Examples

## Example with a non metric dissimilarity matrix: the Protein dataset

data(protein)
clus <- kevclus(D=protein$D,c=4,type='simple',d0=max(protein$D))
z<- cmdscale(protein$D,k=2)  # Computation of 2 attributes by Multidimensional Scaling
plot(clus,X=z,mfrow=c(2,2),ytrue=protein$y,Outliers=FALSE,Approx=1)




