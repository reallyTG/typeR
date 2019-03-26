library(micropan)


### Name: distManhattan
### Title: Computing Manhattan distances between genomes
### Aliases: distManhattan

### ** Examples

# Loading two Panmat objects in the micropan package
data(list=c("Mpneumoniae.blast.panmat","Mpneumoniae.domain.panmat"),package="micropan")

# Manhattan distances based on a BLAST clustering Panmat object
Mdist.blast <- distManhattan(Mpneumoniae.blast.panmat)

# Manhattan distances based on domain sequence clustering Panmat object
Mdist.domains <- distManhattan(Mpneumoniae.domain.panmat,scale=0.5)




