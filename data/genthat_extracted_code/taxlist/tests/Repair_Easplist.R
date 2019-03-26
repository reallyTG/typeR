# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(taxlist)

data(Easplist)

# Retrieve those names
Twice <- with(Easplist@taxonNames, {
            Twice <- paste(TaxonName, AuthorName)
            Twice <- Twice[duplicated(Twice)]
            Twice <- paste(TaxonName, AuthorName) %in% Twice
        }
)
Twice <- Easplist@taxonNames[Twice,]
Twice

# Display the concepts
summary(Easplist, Twice$TaxonConceptID)

# Eliminate two duplicated concepts
Easplist <- subset(Easplist, !TaxonConceptID %in% c(50618,51913),
        slot="relations")

validObject(Easplist)

# Write output
setwd("M:/WorkspaceEclipse/taxlist/data")
save(Easplist, file="Easplist.rda")
