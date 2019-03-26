library(Rnets)


### Name: Assign_Emetadata
### Title: Assign_Emetadata - Methods for assigning network edge metadata
### Aliases: Assign_Emetadata Assign_Emetadata,rnetBasic-method
###   Assign_Emetadata,rnetStrata-method

### ** Examples


#'E_ATTRS' is a data.frame included in the package containing line type and weight  
#     for plotting edges ('lty' & 'width', respectively) that represent partial
#     correlation magnitude and sign held in attribute 'omega'. 

ABX_LIST <- c('AMP', 'AMC', 'AXO', 'TIO', 'NAL', 'CIP', 'STR', 'GEN', 'COT', 'FIS')

EC08_rnet <- Rnet(NARMS_EC_DATA, 
  L1 = 0.25, 
  vert = ABX_LIST, 
  subset = NARMS_EC_DATA$Year == 2008
  )

#Attributes prior to additions
edge_attr_names(EC08_rnet@R)
edge_attr(EC08_rnet@R)

OMEGA_CUTS <- c(0, 0.05, 0.10, 0.20, 1) #Cutpoints to sort abs(omega) into 4 bins

Assign_Emetadata(EC08_rnet, 
                 E_metadata = E_ATTRS,
                 match_attr = 'omega',
                 e_cuts = OMEGA_CUTS
                 )

#NOTE: EC08_rnet does not need to be reassigned for brevity. Returns data.frame of assigned data.
#      Reassignment can be performed, if desired. data.frame not returned in such a case.

EC08_withAttrs <- Assign_Emetadata(EC08_rnet, 
                 E_metadata = E_ATTRS,
                 match_attr = 'omega',
                 e_cuts = OMEGA_CUTS
                 )

#Atrributes after edges assigned.
edge_attr(EC08_rnet@R)

#NOTE: Edge color assigned as per default behavior.



