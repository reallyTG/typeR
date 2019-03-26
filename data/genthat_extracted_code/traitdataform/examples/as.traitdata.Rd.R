library(traitdataform)


### Name: as.traitdata
### Title: Standardize format of traitdata
### Aliases: as.traitdata

### ** Examples


## Not run: 
##D # species-trait matrix:
##D 
##D pulldata("carabids")
##D 
##D dataset1 <- as.traitdata(carabids,
##D   taxa = "name_correct",
##D   traits = c("body_length", "antenna_length", "metafemur_length"),
##D   units = "mm",
##D   keep = c(basisOfRecordDecription = "source_measurement", measurementRemark = "note")
##D   )
##D 
##D # occurrence table:
##D 
##D pulldata("heteroptera_raw")
##D 
##D dataset2 <- as.traitdata(heteroptera_raw,
##D   taxa = "SpeciesID",
##D   traits = c("Body_length", "Body_width", "Body_height", "Thorax_length",
##D     "Thorax_width", "Head_width", "Eye_width", "Antenna_Seg1", "Antenna_Seg2",
##D     "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5", "Front.Tibia_length",
##D     "Mid.Tibia_length", "Hind.Tibia_length", "Front.Femur_length",
##D     "Hind.Femur_length", "Front.Femur_width", "Hind.Femur_width",
##D     "Rostrum_length", "Rostrum_width", "Wing_length", "Wing_widt"),
##D   units = "mm",
##D   keep = c(sex = "Sex", references = "Source", lifestage = "Wing_development"),
##D   metadata = as.metadata(
##D     author = "Gossner MM, Simons NK, HC6ck L and Weisser WW",
##D     datasetName = "Morphometric traits Heteroptera",
##D     bibliographicCitation = attributes(heteroptera_raw)$citeAs,
##D     license = "http://creativecommons.org/publicdomain/zero/1.0/"
##D     )
##D )
## End(Not run)




