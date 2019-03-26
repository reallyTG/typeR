# TODO:   Script for actualize the example data 'Easplist'
# 
# Author: Miguel Alvarez
################################################################################

## # Import last version of taxlist
## library(devtools)
## install_github("kamapu/taxlist")
## 
## # Load and write the data
## library(taxlist)
## Easplist <- tv2taxlist("Easplist")
## validObject(Easplist)
## summary(Easplist)
## 
## # Modify concept view
## Easplist@taxonViews[1,c("Author","Title","Published")] <- c("Ville de Geneve",
##         "African Plant Database",
##         "http://www.ville-ge.ch/musinfo/bd/cjb/africa/recherche.php")

# Old version of Easplist
library(taxlist)
data(Easplist)

# New version of SWEA-Dataveg
library(vegtable)
setwd("M:/WorkspaceR/00_DB_backups")
load_last("sweadataveg/Sweadataveg")
# Not working!!!
## load_last("M:/WorkspaceR/00_DB_backups/sweadataveg/Sweadataveg")

Concepts <- accepted_name(Easplist)
Concepts <- subset(Concepts, paste(Level) == "species")

Easplist <- subset(Swea@species, TaxonConceptID %in% Concepts$TaxonConceptID,
		slot="relations", keep_children=TRUE, keep_parents=TRUE)
Easplist@taxonNames$AuthorName <- iconv(Easplist@taxonNames$AuthorName, "UTF8",
		"UTF8")

save(Easplist, file="M:/WorkspaceR/taxlist/data/Easplist.rda")
