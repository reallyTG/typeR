library(Rnets)


### Name: Assign_Vmetadata
### Title: Assign_Vmetadata - Methods for assigning network vertex metadata
### Aliases: Assign_Vmetadata Assign_Vmetadata,rnetBasic-method
###   Assign_Vmetadata,rnetStrata-method

### ** Examples

# V_ATTRS' is a data.frame included in the package containing vertex metadata
#     regarding antimicrobial class and a color scheme for the vertices. These 
#     attributes are useful for plotting and determining modularity.

ABX_LIST <- c('AMP', 'AMC', 'AXO', 'TIO', 'NAL', 'CIP', 'STR', 'GEN', 'COT', 'FIS')

EC08_rnet <- Rnet(NARMS_EC_DATA, 
  L1 = 0.25, 
  vertices = ABX_LIST, 
  subset = NARMS_EC_DATA$Year == 2008
  )

#Attributes prior to additions
vertex_attr_names(EC08_rnet@R)
vertex_attr(EC08_rnet@R)

Assign_Vmetadata(EC08_rnet, 
                 V_metadata = V_ATTRS,
                 match_attr = 'Code',
                 V_match_attr = 'name'
                 )

#NOTE: EC08_rnet does not need to be reassigned for brevity. Returns data.frame of assigned data.
#      Reassignment can be performed, if desired. data.frame not returned in such a case.

EC08_withAttrs <- Assign_Vmetadata(EC08_rnet, 
                 V_metadata = V_ATTRS,
                 match_attr = 'Code',
                 V_match_attr = 'name'
                 )

#Atrributes after edges assigned.
vertex_attr(EC08_rnet@R)



