library(traitdataform)


### Name: rbind.traitdata
### Title: Combine trait datasets
### Aliases: rbind.traitdata

### ** Examples


pulldata("carabids")

dataset1 <- as.traitdata(carabids,
  taxa = "name_correct",
  traits = c("body_length", "antenna_length", "metafemur_length"),
  units = "mm",
  keep = c(datasetID = "source_measurement", measurementRemarks = "note"),
  metadata = as.metadata(
    bibliographicCitation = c(
        "van der Plas et al. (2017) Methods in Ecol. & Evol., doi: 10.1111/2041-210x.12728"
       ),
    author = "Fons van der Plas",
    license = "http://creativecommons.org/publicdomain/zero/1.0/"
    )
)


traits1 <- as.thesaurus(
 body_length = as.trait("body_length",
   expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length"),
 antenna_length = as.trait("antenna_length",
   expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length"),
 metafemur_length = as.trait("metafemur_length",
   expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length")
)

dataset1Std <- standardize.traits(dataset1, thesaurus = traits1)

# occurrence table:

pulldata("heteroptera_raw")

dataset2 <- as.traitdata(heteroptera_raw,
  taxa = "SpeciesID",
  traits = c("Body_length", "Antenna_Seg1", "Antenna_Seg2",
    "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5", "Hind.Femur_length"),
  units = "mm",
  keep = c(sex = "Sex", references = "Source", lifeStage = "Wing_development"),
  metadata = as.metadata(
    bibliographicCitation = "Gossner et al. (2015) Ecology, 96:1154. doi: 10.1890/14-2159.1",
    author = "Martin Gossner",
    license = "http://creativecommons.org/publicdomain/zero/1.0/"
    )
)

dataset2 <- mutate.traitdata(dataset2,
  antenna_length = Antenna_Seg1 + Antenna_Seg2 + Antenna_Seg3 + Antenna_Seg4 + Antenna_Seg5
  )


traits2 <- as.thesaurus(
 Body_length = as.trait("body_length",
   expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length"),
 antenna_length = as.trait("antenna_length",
   expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length"),
 Hind.Femur_length = as.trait("metafemur_length",
   expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length")
)

dataset2Std <- standardize_traits(dataset2, thesaurus = traits2)

database <- rbind(dataset1Std, dataset2Std, 
                   datasetID = c("vanderplas17", "gossner15"),
                   metadata_as_columns = c("author"))
head(database)



