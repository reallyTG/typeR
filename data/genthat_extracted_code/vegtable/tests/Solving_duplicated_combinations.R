# TODO:   Retrieve duplicated names combinations
# 
# Author: Miguel Alvarez
################################################################################

# Check duplicated names with same authors
with(Kenya_veg@species@taxonNames, any(duplicated(paste(TaxonName,
                                AuthorName))))

# Retrieve those names
Twice <- with(Kenya_veg@species@taxonNames, {
            Twice <- paste(TaxonName, AuthorName)
            Twice <- Twice[duplicated(Twice)]
            Twice <- paste(TaxonName, AuthorName) %in% Twice
    }
)
Twice <- Kenya_veg@species@taxonNames[Twice,]
Twice

# Display the concepts
summary(Kenya_veg@species, Twice$TaxonConceptID)

# Solution

# 54195 to 50523 and 54248 to 54244
Kenya_veg@samples$TaxonUsageID[Kenya_veg@samples$TaxonUsageID == 54195] <- 50523
Kenya_veg@samples$TaxonUsageID[Kenya_veg@samples$TaxonUsageID == 54248] <- 54244
# Delete the usages
Kenya_veg@species@taxonNames <- Kenya_veg@species@taxonNames[
        !Kenya_veg@species@taxonNames$TaxonUsageID %in% c(54195,54248),]

# Write output
setwd("M:/WorkspaceEclipse/taxlist/data")
save(Easplist, file="Easplist.rda")
