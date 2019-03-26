library(ergm)


### Name: node-attr-api
### Title: Helper functions for specifying nodal attribute levels
### Aliases: node-attr-api ergm_get_vattr ergm_get_vattr.character
###   ergm_get_vattr.function ergm_get_vattr.formula ergm_attr_levels
###   ergm_attr_levels.numeric ergm_attr_levels.logical
###   ergm_attr_levels.AsIs ergm_attr_levels.character
###   ergm_attr_levels.NULL ergm_attr_levels.function
###   ergm_attr_levels.formula ERGM_VATTR_SPEC ERGM_LEVELS_SPEC
### Keywords: datasets

### ** Examples

data(florentine)
ergm_get_vattr("priorates", flomarriage)
ergm_get_vattr(~priorates, flomarriage)
ergm_get_vattr(c("wealth","priorates"), flomarriage)
ergm_get_vattr(~priorates>30, flomarriage)
(a <- ergm_get_vattr(~cut(priorates,c(-Inf,0,20,40,60,Inf),label=FALSE)-1, flomarriage))
ergm_attr_levels(NULL, a, flomarriage)
ergm_attr_levels(-1, a, flomarriage)
ergm_attr_levels(1:2, a, flomarriage)
ergm_attr_levels(I(1:2), a, flomarriage)



