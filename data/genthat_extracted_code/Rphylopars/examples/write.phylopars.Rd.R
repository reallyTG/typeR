library(Rphylopars)


### Name: write.phylopars
### Title: Write data and tree files for Python phylopars compatability.
### Aliases: write.phylopars

### ** Examples

# simulate data
sim_data <- simtraits(ntaxa = 15,ntraits = 4,nreps = 3,nmissing = 10)

write.phylopars(trait_data = sim_data$trait_data,tree = sim_data$tree,data_file = "data_path.txt",
tree_file = "tree_path.new")



