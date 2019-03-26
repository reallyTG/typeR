library(beautier)


### Name: yule_tree_prior_to_xml_prior_distr
### Title: Creates the 'prior' section in the prior section of the prior
###   section of the distribution section of a BEAST2 XML parameter file
###   for a Yule tree prior
### Aliases: yule_tree_prior_to_xml_prior_distr

### ** Examples

 # <distribution id="posterior" spec="util.CompoundDistribution">
 #     <distribution id="prior" spec="util.CompoundDistribution">
 #       HERE, where the ID of the distribution is 'prior'
 #     </distribution>
 #     <distribution id="likelihood" ...>
 #     </distribution>
 # </distribution>



