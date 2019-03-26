library(compositions)


### Name: plot.acomp
### Title: Ternary diagrams
### Aliases: plot.acomp plot.rcomp plot.ccomp
### Keywords: hplot

### ** Examples

data(SimulatedAmounts)
plot(acomp(sa.lognormals))
plot(acomp(sa.lognormals),axes=TRUE)
plot(rcomp(sa.lognormals))
plot(rcomp(sa.lognormals5))

plot(acomp(sa.lognormals5),pca=TRUE,col.pca="red")
plot(rcomp(sa.lognormals5),pca=TRUE,col.pca="red",axes=TRUE)



