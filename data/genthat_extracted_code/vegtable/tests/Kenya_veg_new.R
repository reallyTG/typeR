# TODO:   Adjusting Kenya_veg to the last taxlist version
# 
# Author: Miguel Alvarez
################################################################################

library(vegtable)

data(Kenya_veg)
new_tax <- new("taxlist")
Kenya_veg@species@taxonRelations$ViewID <- NA
Kenya_veg@species@taxonViews <- new_tax@taxonViews

summary(Kenya_veg)

save(Kenya_veg, file="M:/WorkspaceR/vegtable/data/Kenya_veg.rda")

data(dune_veg)
dune_veg@species@taxonViews <- new_tax@taxonViews
summary(dune_veg)

save(dune_veg, file="M:/WorkspaceR/vegtable/data/dune_veg.rda")

data(Wetlands)
Wetlands_veg@species@taxonViews <- new_tax@taxonViews
summary(Wetlands_veg)

save(Wetlands_veg, Wetlands, file="M:/WorkspaceR/vegtable/data/Wetlands.rda")
