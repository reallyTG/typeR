library(evclust)


### Name: protein
### Title: Protein dataset
### Aliases: protein
### Keywords: datasets

### ** Examples

data(protein)
z<- cmdscale(protein$D,k=2)  # Multidimensional scaling
plot(z[,1],z[,2],xlab=expression(z[1]),ylab=expression(z[2]),pch=protein$y,col=protein$y)



