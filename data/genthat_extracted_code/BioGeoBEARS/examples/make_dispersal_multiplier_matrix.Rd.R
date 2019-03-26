library(BioGeoBEARS)


### Name: make_dispersal_multiplier_matrix
### Title: Make a default matrix of relative dispersal probabilities
###   between areas
### Aliases: make_dispersal_multiplier_matrix

### ** Examples

testval=1
make_dispersal_multiplier_matrix(areas=NULL,
states_list=list("_", c("A"), c("B"), c("C"),
c("A","B"), c("B","C"), c("A","C"), c("A","B","C")))
make_dispersal_multiplier_matrix(areas=c("A","B","C","D"))



