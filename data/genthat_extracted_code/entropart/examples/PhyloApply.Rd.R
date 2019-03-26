library(entropart)


### Name: PhyloApply
### Title: Apply a Function over a Phylogenetic Tree
### Aliases: PhyloApply

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest
#      and their taxonomy)
data(Paracou618)
# Plot the taxonomy
plot(Paracou618.Taxonomy, type="fan", show.tip.label=FALSE)
# Calculate the mean number of trees (individuals) per species 
# (Cuts are 1=species, 2=genus, 3=family)
PhyloApply(Paracou618.Taxonomy, mean, Paracou618.MC$Ns, TRUE)



