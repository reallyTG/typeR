library(micropan)


### Name: rarefaction
### Title: Rarefaction curves for a pan-genome
### Aliases: rarefaction

### ** Examples

# Loading two Panmat objects in the micropan package 
data(list=c("Mpneumoniae.blast.panmat","Mpneumoniae.domain.panmat"),package="micropan")

# Rarefaction based on a BLAST clustering Panmat object
rarefac.blast <- rarefaction(Mpneumoniae.blast.panmat,n.perm=100)
plot(rarefac.blast)

# Rarefaction based on domain sequence clustering Panmat object
rarefac.domains <- rarefaction(Mpneumoniae.domain.panmat,n.perm=1000)
summary(rarefac.domains)




