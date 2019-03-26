library(ergm.ego)


### Name: node-attr-api
### Title: Helper functions for specifying nodal attribute levels
### Aliases: node-attr-api ergm.ego_get_vattr ergm.ego_get_vattr.character
###   ergm.ego_get_vattr.function ergm.ego_get_vattr.formula
###   ergm.ego_attr_levels ergm.ego_attr_levels.numeric
###   ergm.ego_attr_levels.logical ergm.ego_attr_levels.AsIs
###   ergm.ego_attr_levels.character ergm.ego_attr_levels.NULL
###   ergm.ego_attr_levels.function ergm.ego_attr_levels.formula

### ** Examples

data(florentine)
flomego <- as.egodata(flomarriage)
ergm.ego_get_vattr("priorates", flomego$egos)
ergm.ego_get_vattr(~priorates, flomego$alters)
ergm.ego_get_vattr(c("wealth","priorates"), flomego$egos)
ergm.ego_get_vattr(~priorates>30, flomego$alters)
(a <- ergm.ego_get_vattr(~cut(priorates,c(-Inf,0,20,40,60,Inf),label=FALSE)-1, flomego$egos))
ergm.ego_attr_levels(NULL, a, flomego$egos)
ergm.ego_attr_levels(-1, a, flomego$egos)
ergm.ego_attr_levels(1:2, a, flomego$egos)
ergm.ego_attr_levels(I(1:2), a, flomego$egos)



