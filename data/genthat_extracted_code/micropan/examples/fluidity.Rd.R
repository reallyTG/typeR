library(micropan)


### Name: fluidity
### Title: Computing genomic fluidity for a pan-genome
### Aliases: fluidity

### ** Examples

# Loading two Panmat objects in the micropan package
data(list=c("Mpneumoniae.blast.panmat","Mpneumoniae.domain.panmat"),package="micropan")

# Fluidity based on a BLAST clustering Panmat object
fluid.blast <- fluidity(Mpneumoniae.blast.panmat)

# Fluidity based on domain sequence clustering Panmat object
fluid.domains <- fluidity(Mpneumoniae.domain.panmat)




