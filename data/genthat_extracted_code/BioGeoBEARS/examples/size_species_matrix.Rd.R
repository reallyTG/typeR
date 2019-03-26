library(BioGeoBEARS)


### Name: size_species_matrix
### Title: Calculate the dimensions of the cladogenesis/speciation matrix
### Aliases: size_species_matrix

### ** Examples

testval=1
spmat_dimensions = size_species_matrix(
states_list=list("_", c("A"), c("B"), c("C"), c("A","B"),
c("B","C"), c("A","C"), c("A","B","C")), printwarn=1)
spmat_dimensions



