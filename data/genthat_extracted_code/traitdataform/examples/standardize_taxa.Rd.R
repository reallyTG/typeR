library(traitdataform)


### Name: standardize_taxa
### Title: Standardize scientific names of species
### Aliases: standardize_taxa standardize.taxonomy standardise_taxa

### ** Examples


## Not run: 
##D 
##D pulldata("carabids")
##D 
##D dataset1 <- as.traitdata(carabids,
##D   taxa = "name_correct",
##D   traits = c("body_length", "antenna_length", "metafemur_length"),
##D   units = "mm",
##D   keep = c(datasetID = "source_measurement", measurementRemark = "note"),
##D   metadata = list(
##D     bibliographicCitation = attributes(carabids)$citeAs,
##D     author = "Fons van der Plas",
##D     license = "http://creativecommons.org/publicdomain/zero/1.0/"
##D     )
##D )
##D 
##D dataset1Std <- standardize_taxa(dataset1)
## End(Not run)



