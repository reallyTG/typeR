library(beautier)


### Name: create_beast2_input_distr_lh
### Title: Creates the likelihood section in the distribution section of a
###   BEAST2 XML parameter file
### Aliases: create_beast2_input_distr_lh

### ** Examples

 # <distribution id="posterior" spec="util.CompoundDistribution">
 #     <distribution id="prior" spec="util.CompoundDistribution">
 #     </distribution>
 #     <distribution id="likelihood" ...>
 #       HERE, where the ID of the distribution is 'likelihood'
 #     </distribution>
 # </distribution>



