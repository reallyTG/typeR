# TODO:   Inserting field 'Secuncum' in 'taxonViews'
# 
# Author: Miguel Alvarez
################################################################################

library(taxlist)

data(Easplist)

Views <- Easplist@taxonViews
Views$Secundum <- c("African Plant Database", "The Plant List (2013)")
Easplist@taxonViews <- Views[,c("ViewID","Secundum","Author","Year","Title",
				"Published")]

# Write object
save(Easplist, file="M:/WorkspaceR/taxlist/data/Easplist.rda")
