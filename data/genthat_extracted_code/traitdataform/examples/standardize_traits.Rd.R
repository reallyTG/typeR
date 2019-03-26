library(traitdataform)


### Name: standardize_traits
### Title: Standardize trait names and harmonize measured values and
###   reported facts
### Aliases: standardize_traits standardise_traits standardize.traits

### ** Examples



pulldata("carabids")

dataset1 <- as.traitdata(carabids, 
  taxa = "name_correct", 
  traits = c("body_length", "antenna_length", "metafemur_length"),
  units = "mm",
  keep = c(datasetID = "source_measurement", measurementRemark = "note"), 
  metadata = list(
    bibliographicCitation = attributes(carabids)$citeAs,
    author = "Fons van der Plas", 
    license = "http://creativecommons.org/publicdomain/zero/1.0/"
    )
)

traitlist <- as.thesaurus(
body_length = as.trait("body_length", expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length"), 
antenna_length = as.trait("antenna_length", expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length"),
metafemur_length = as.trait("metafemur_length", expectedUnit = "mm", valueType = "numeric",
   identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length")
)

dataset1Std <- standardize_traits(dataset1, thesaurus = traitlist)



## Example: matching of original names to thesaurus

pulldata("heteroptera_raw")

dataset2 <- as.traitdata(heteroptera_raw, 
  taxa = "SpeciesID", 
  traits = c("Body_length", "Antenna_Seg1", "Antenna_Seg2",
    "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5", "Hind.Femur_length"),
  units = "mm", 
  keep = c(sex = "Sex", references = "Source", lifestage = "Wing_development"),
  metadata = list(
    bibliographicCitation = attributes(heteroptera_raw)$citeAs, 
    license = "http://creativecommons.org/publicdomain/zero/1.0/"
    )
)


traits2 <- as.thesaurus(
    Body_length = as.trait("Body_length",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "From the tip of the head to the end of the abdomen"),
    Antenna_Seg1 = as.trait("Antenna_Seg1",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "Length of first antenna segment",
            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg2 = as.trait("Antenna_Seg2",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "Length of second antenna segment",
            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg3 = as.trait("Antenna_Seg3",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "Length of third antenna segment",
            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg4 = as.trait("Antenna_Seg4",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "Length of fourth antenna segment",
            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg5 = as.trait("Antenna_Seg5",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "Length of fifth antenna segment (only Pentatomoidea)",
            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Hind.Femur_length = as.trait("Hind.Femur_length",
            expectedUnit = "mm", valueType = "numeric",
            traitDescription = "Length of the femur of the hind leg",
            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length")
    )

dataset2Std <- standardize_traits(dataset2, 
    thesaurus = traits2
    )




