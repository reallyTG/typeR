# TODO:   Generating example data 'Easplist'
# 
# Author: Miguel Alvarez
################################################################################

library(taxlist)

setwd("M:/WorkspaceEclipse/taxlist/tests/hidden_data/Easplist")

Easplist <- new("taxlist")

## for(i in slotNames(Easplist)) {
##     slot(Easplist, i) <- read.csv(paste(i, "csv", sep="."),
##             fileEncoding="latin1", stringsAsFactors=FALSE)
## }

for(i in c("taxonNames","taxonRelations","taxonViews")) {
    slot(Easplist, i) <- read.csv(paste(i, "csv", sep="."),
            fileEncoding="latin1", stringsAsFactors=FALSE)[,-1]
}

# Only accepted names
AcceptedNames <- subset(Easplist@taxonNames,
        TaxonUsageID %in% Easplist@taxonRelations$AcceptedName)

# Exploring subspecific taxa
AcceptedNames$form <- grepl(" f. ", AcceptedNames$TaxonName, fixed=TRUE)
AcceptedNames$variety <- grepl(" v. ", AcceptedNames$TaxonName, fixed=TRUE) |
        grepl(" var. ", AcceptedNames$TaxonName, fixed=TRUE)
AcceptedNames$subspecies <- grepl(" s. ", AcceptedNames$TaxonName, fixed=TRUE) |
        grepl(" ssp. ", AcceptedNames$TaxonName, fixed=TRUE)

# Information of taxonomic level
AcceptedNames$Level <- "species"
AcceptedNames$Level[grepl("Working", AcceptedNames$TaxonName, fixed=TRUE)] <- NA
AcceptedNames$Level[AcceptedNames$form] <- "form"
AcceptedNames$Level[AcceptedNames$variety] <- "variety"
AcceptedNames$Level[AcceptedNames$subspecies] <- "subspecies"
Easplist@taxonRelations$Level <- AcceptedNames$Level[
        match(Easplist@taxonRelations$TaxonConceptID,
                AcceptedNames$TaxonConceptID)]

# Table of Genera
Genera <- read.csv("taxonTraits.csv", fileEncoding="latin1",
        stringsAsFactors=FALSE)[,-1]
Genera <- Genera[Genera$GENUS != "",]

Easplist <- add_concept(Easplist, TaxonName=unique(Genera$GENUS),
        Level=rep("genus", length(unique(Genera$GENUS))),
        ViewID=rep(2, length(unique(Genera$GENUS))))

Genera$GenusID <- Easplist@taxonNames$TaxonConceptID[match(Genera$GENUS,
                Easplist@taxonNames$TaxonName)]

AcceptedNames$Parent <- Genera$GenusID[match(AcceptedNames$TaxonConceptID,
                Genera$TaxonConceptID)]

# Now Adding families
Easplist <- add_concept(Easplist, TaxonName=unique(Genera$FAMILY),
        Level=rep("family", length(unique(Genera$FAMILY))),
        ViewID=rep(2, length(unique(Genera$FAMILY))))

Genera$FamilyID <- Easplist@taxonNames$TaxonConceptID[match(Genera$FAMILY,
                Easplist@taxonNames$TaxonName)]

# Making a valid object
Easplist <- add_view(Easplist, Author="The Plant List", Year=2013,
        Title="The Plant List version 1.1",
        Published="http://www.theplantlist.org/1.1/about/")
Easplist@taxonRelations$Level <- factor(Easplist@taxonRelations$Level,
        levels=c("form","variety","subspecies","species","genus","family"))

# Assigning Parents
Parents <- list(AcceptedNames[,c("TaxonConceptID","Parent")],
        Genera[!duplicated(Genera$GenusID),c("GenusID","FamilyID")])
colnames(Parents[[2]]) <- colnames(Parents[[1]])
Parents <- do.call(rbind, Parents)

Easplist@taxonRelations$Parent <- Parents$Parent[
        match(Easplist@taxonRelations$TaxonConceptID, Parents$TaxonConceptID)]

# Finally, include life forms of some species
Lifeforms <- read.csv("Lifeforms.csv", stringsAsFactors=FALSE)
LF2 <- AcceptedNames[,c("TaxonConceptID","TaxonName")]
LF2$ID2 <- Lifeforms$TaxonConceptID[
        charmatch(LF2$TaxonName, Lifeforms$TaxonName)]
LF2 <- LF2[!is.na(LF2$ID2),]
LF2$Name_ref <- Lifeforms$TaxonName[match(LF2$ID2, Lifeforms$TaxonConceptID)]
LF2$LifeForm <- Lifeforms$LifeForm[match(LF2$ID2, Lifeforms$TaxonConceptID)]
LF2 <- LF2[LF2$LifeForm != "",]

taxon_traits(Easplist) <- LF2[,c("TaxonConceptID","LifeForm")]

Easplist@taxonNames$AuthorName <- iconv(Easplist@taxonNames$AuthorName,
        "latin1", "UTF-8")

# Write object
setwd("M:/WorkspaceEclipse/taxlist/data")
save(Easplist, file="Easplist.rda")

#-------------------------------------------------------------------------------
# Check encoding of author names
library(stringi)
stri_enc_mark(Easplist@taxonNames$AuthorName)
