# TODO:   Check and solve encoding problems
# 
# Author: Miguel Alvarez
################################################################################

library(taxlist)
library(stringi)

# Data
data(Easplist)
load("M:/WorkspaceEclipse/taxlist/tests/hidden_data/Families_tpl.rda")

# Cleaning genera
Families <- subset(Families, status == "accepted")
Gen_dupl <- unique(Families[duplicated(Families$genus),"genus"])
Families <- subset(Families, !genus %in% Gen_dupl)

# Clean species list
Easplist@taxonNames$TaxonName <- sub("Hmyenophyllum", "Hymenophyllum",
        Easplist@taxonNames$TaxonName)
Easplist@taxonNames$TaxonName <- sub("Klanchoe", "Kalanchoe",
        Easplist@taxonNames$TaxonName)
Easplist@taxonNames$TaxonName <- sub("Solenostemom", "Solenostemon",
        Easplist@taxonNames$TaxonName)
Easplist@taxonNames$TaxonName <- sub("Rytiginya", "Rytigynia",
        Easplist@taxonNames$TaxonName)
Easplist@taxonNames$TaxonName <- sub("Launea", "Launaea",
        Easplist@taxonNames$TaxonName)

# Extract genera from species list
Genera <- with(Easplist@taxonNames,
        TaxonName[match(Easplist@taxonRelations$AcceptedName, TaxonUsageID)])
Genera <- sapply(strsplit(Genera, " ", fixed=TRUE), "[", 1)

# Check occurrence of genera
all(Genera %in% Families$genus)
unique(Genera[!Genera %in% Families$genus])

# Additional families
Families2 <- data.frame(genus=c("Bulbostylis","Cynodon","Helosciadium",
                "Hygrophila","Leersia","Brachypodium","Mystroxylon","Hallea",
                "Hagenia","Celsia","Elyonurus","Diplachne","Aphania",
                "Linderniella","Abildgaardia","Pancovia"),
        family=c("Cyperaceae","Poaceae","Apiaceae","Acanthaceae","Poaceae",
                "Poaceae","Celastraceae","Rubiaceae","Rosaceae",
                "Scrophulariaceae","Poaceae","Poaceae","Sapindaceae",
                "Linderniaceae","Cyperaceae","Sapindaceae"),
        stringsAsFactors=FALSE)
# check
all(Families2$family %in% Families$family)

Families <- do.call(rbind, list(Families[,c("genus","family")], Families2))

# Final format of table
Genera[Genera == "Working"] <- NA
Genera <- data.frame(genus=Genera, family="", stringsAsFactors=FALSE)
Genera$family <- Families$family[match(Genera$genus, Families$genus)]

Easplist@taxonTraits <- data.frame(
        TaxonConceptID=Easplist@taxonRelations$TaxonConceptID,
        GENUS=Genera$genus, FAMILY=Genera$family, stringsAsFactors=FALSE)

Easplist@taxonNames <- Easplist@taxonNames[,c("TaxonConceptID","TaxonUsageID",
                "TaxonName","AuthorName")]
Easplist@taxonNames$enc <- stri_enc_mark(Easplist@taxonNames$AuthorName)

# Write output
setwd("M:/WorkspaceEclipse/taxlist/tests/hidden_data/Easplist")
for(i in slotNames(Easplist)) {
    write.csv(slot(Easplist,i), paste(i, "csv", sep="."), na="",
            row.names=FALSE, fileEncoding="latin1")
}
