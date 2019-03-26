library(RandomFields)


### Name: Constants
### Title: Constants used in RandomFields (RC constants)
### Aliases: constants RC RC_ISOTROPIC RC_ISO_NAMES RC_TYPE_NAMES
###   RC_DOMAIN_NAMES RC_MONOTONE_NAMES RC_SPACEISOTROPIC
###   RC_CARTESIAN_COORD RC_GNOMONIC_PROJ RC_ORTHOGRAPHIC_PROJ
###   RC_EARTH_COORDS RC_SPHERICAL_COORDS RC_OPTIMISER_NAMES
###   RC_NLOPTR_NAMES RC_LIKELIHOOD_NAMES RC_EARTH_ISOTROPIC
###   RC_DOUBLEISOTROPIC RC_EARTH_ISOTROPIC RC_UNREDUCED
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RC_ISO_NAMES
RC_ISO_NAMES[RC_ISOTROPIC:RC_CARTESIAN_COORD + 1]
## Not run: 
##D RFgetModelNames(isotropy=RC_ISO_NAMES[RC_ISOTROPIC:RC_CARTESIAN_COORD +
##D 1])
## End(Not run)
## Don't show: 
FinalizeExample()
## End(Don't show)


