library(micropan)


### Name: panpca
### Title: Principal component analysis of a pan-matrix
### Aliases: panpca

### ** Examples

# Loading two Panmat objects in the micropan package
data(list=c("Mpneumoniae.blast.panmat","Mpneumoniae.domain.panmat"),package="micropan")

# Panpca based on a BLAST clustering Panmat object
ppca.blast <- panpca(Mpneumoniae.blast.panmat)
plot(ppca.blast) # The generic plot function
plotScores(ppca.blast) # A score-plot

# Panpca based on domain sequence clustering Panmat object
w <- geneWeights(Mpneumoniae.domain.panmat,type="shell")
ppca.domains <- panpca(Mpneumoniae.domain.panmat,scale=0.5,weights=w)
summary(ppca.domains)
plotLoadings(ppca.domains)




