# TODO:   Script to write some portable data
# 
# Author: Miguel Alvarez
################################################################################

library(taxlist)
data(Easplist)

Cyperus <- subset(Easplist, Traits=GENUS == "Cyperus")
summary(Cyperus)

PATH <- "M:/WorkspaceEclipse/taxlist/inst/cyperus"
write.csv(Cyperus@taxonNames, file.path(PATH, "names.csv"), row.names=FALSE)
write.csv(Cyperus@taxonTraits, file.path(PATH, "traits.csv"), row.names=FALSE)
