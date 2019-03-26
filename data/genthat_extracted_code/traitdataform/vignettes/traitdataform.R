## ---- echo = FALSE, warning= FALSE, message=FALSE------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

library(traitdataform)

## ---- eval = FALSE-------------------------------------------------------
#  carabids <- read.table("../../data/carabid traits final.txt", header = TRUE)

## ------------------------------------------------------------------------
# pulling data from van der Plas F, van Klink R, Manning P, Olff H, Fischer M (2017) Sensitivity of functional diversity metrics to sampling intensity. Methods in Ecology and Evolution 8(9): 1072-1080. https://doi.org/10.1111/2041-210x.12728

carabids <- read.delim("https://datadryad.org/bitstream/handle/10255/dryad.134418/carabid%20traits%20final.txt")


## ---- warning=FALSE------------------------------------------------------
dataset1 <- as.traitdata(carabids, 
                         taxa = "name_correct",
                         traits = c("body_length", 
                                    "antenna_length", 
                                    "metafemur_length", 
                                    "eyewidth_corr"),
                         units = "mm"
                         )

head(dataset1)

## ------------------------------------------------------------------------
heteroptera_raw <-  read.delim(url("https://ndownloader.figshare.com/files/5633883", 
                                         encoding = "windows-1252"),
                                    stringsAsFactors=TRUE)

# Data pulication: M. Gossner, Martin; K. Simons, Nadja; Höck, Leonhard; W.
# Weisser, Wolfgang (2016): Morphometric measures of Heteroptera sampled in
# grasslands across three regions of Germany. figshare.
# https://doi.org/10.6084/m9.figshare.c.3307611.v1


dataset2 <- as.traitdata(heteroptera_raw,
              traits = c("Body_length", "Body_width", "Body_height", "Thorax_length",
                         "Thorax_width", "Head_width", "Eye_width", "Antenna_Seg1",
                         "Antenna_Seg2", "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5",
                         "Front.Tibia_length", "Mid.Tibia_length", "Hind.Tibia_length",
                         "Front.Femur_length", "Hind.Femur_length", "Front.Femur_width",
                         "Hind.Femur_width", "Rostrum_length", "Rostrum_width", 
                         "Wing_length", "Wing_width"),
              taxa = "SpeciesID",
              occurrences = "ID"
              )

# show different trait measurements for same occurrence/individual
subset(dataset2, occurrenceID == "5" ) 

## ------------------------------------------------------------------------
dataset2 <- as.traitdata(heteroptera_raw,
              traits = c("Body_length", "Body_width", "Body_height", "Thorax_length",
                         "Thorax_width", "Head_width", "Eye_width", "Antenna_Seg1",
                         "Antenna_Seg2", "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5",
                         "Front.Tibia_length", "Mid.Tibia_length", "Hind.Tibia_length",
                         "Front.Femur_length", "Hind.Femur_length", "Front.Femur_width",
                         "Hind.Femur_width", "Rostrum_length", "Rostrum_width", 
                         "Wing_length", "Wing_width"),
              taxa = "SpeciesID",
              occurrences = "ID",
              keep = c("Sex")
              )

head(dataset2) 

## ------------------------------------------------------------------------
dataset2 <- as.traitdata(heteroptera_raw,
              traits = c("Body_length", "Body_width", "Body_height", "Thorax_length",
                         "Thorax_width", "Head_width", "Eye_width", "Antenna_Seg1",
                         "Antenna_Seg2", "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5",
                         "Front.Tibia_length", "Mid.Tibia_length", "Hind.Tibia_length",
                         "Front.Femur_length", "Hind.Femur_length", "Front.Femur_width",
                         "Hind.Femur_width", "Rostrum_length", "Rostrum_width", 
                         "Wing_length", "Wing_width"),
              taxa = "SpeciesID",
              occurrences = "ID",
              units = "mm",
              keep = c(order = "Order", family = "Family", 
                       sex = "Sex", lifeStage = "Wing_development", 
                       basisOfRecordDescription = "Source", 
                       verbatimLocality = "Center_Sampling_region", 
                       references = "Voucher_ID" )
)

head(dataset2)

## ------------------------------------------------------------------------
dataset2 <- mutate.traitdata(dataset2, 
                            Body_shape = Body_length/Body_width, 
                            Body_volume = Body_length*Body_width*Body_height,
                            Wingload = Wing_length*Wing_width/Body_volume)

head(dataset2[dataset2$traitName %in% c("Body_shape", "Body_volume", "Wingload"),])

## ------------------------------------------------------------------------
as.trait("body_length",
         expectedUnit = "mm", valueType = "numeric",
         traitDescription = "The known longest dimension of the physical structure of organisms",
         identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length",
         author = "Maggenti and Maggenti, 2005",
         broaderTerm = c("http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_dimension"),
         narrowerTerm = c("http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Female_body_length",
                          "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Male_body_length")
         )

## ------------------------------------------------------------------------
thesaurus1 <- as.thesaurus(
          body_length = as.trait("body_length",
                  expectedUnit = "mm", valueType = "numeric",
                  identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length"),
          antenna_length = as.trait("antenna_length",
                  expectedUnit = "mm", valueType = "numeric",
                  identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length"),
          metafemur_length = as.trait("femur_length",
                  expectedUnit = "mm", valueType = "numeric",
                  identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length"),
          eyewidth_corr = as.trait("eye_diameter",
                  expectedUnit = "mm", valueType = "numeric",
                  identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Eye_diameter")
        )

## ------------------------------------------------------------------------
thesaurus1 <- as.thesaurus(data.frame(
                      trait = c("body_length",  "antenna_length", "metafemur_length", "eyewidth_corr"),
                      identifier = paste0("http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=", 
                                          c("Body_length", "Antenna_length", "Femur_length", "Eye_diameter")), 
                      valueType = c("numeric"),
                      expectedUnit = "mm")
)

## ---- message=FALSE, warning=FALSE---------------------------------------
dataset1Std <- standardize_traits(dataset1, thesaurus1)
head(dataset1Std)

## ------------------------------------------------------------------------
# M. Gossner, Martin; K. Simons, Nadja; Höck, Leonhard; W. Weisser, Wolfgang
# (2016): Morphometric measures of Heteroptera sampled in grasslands across
# three regions of Germany. figshare.
# https://doi.org/10.6084/m9.figshare.c.3307611.v1 
# following the definitions in data publication 
# http://www.esapubs.org/archive/ecol/E096/102/metadata.php

thesaurus2 <-  as.thesaurus(
    Body_length = as.trait("Body_length", identifier = "t1",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "From the tip of the head to the end of the abdomen"),
    Body_width = as.trait("Body_width", identifier = "t2",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Widest part of the body"),
    Body_height = as.trait("Body_height",identifier = "t3",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Thickest part of the body"),
    Thorax_length = as.trait("Thorax_length", identifier = "t4",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Longest part of the pronotum"),
    Thorax_width = as.trait("Thorax_width", identifier = "t5",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Widest part of the pronotum"),
    Head_width = as.trait("Head_width", identifier = "t6",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Widest part of the head including eyes"),
    Eye_width = as.trait("Eye_width", identifier = "t7",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Widest part of the left eye"),
    Antenna_Seg1 = as.trait("Antenna_Seg1", identifier = "t8",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of first antenna segment",
                            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg2 = as.trait("Antenna_Seg2", identifier = "t9",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of second antenna segment",
                            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg3 = as.trait("Antenna_Seg3", identifier = "t10",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of third antenna segment",
                            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg4 = as.trait("Antenna_Seg4", identifier = "t11",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of fourth antenna segment",
                            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Antenna_Seg5 = as.trait("Antenna_Seg5", identifier = "t12",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of fifth antenna segment (only Pentatomoidea)",
                            broaderTerm = "http://ecologicaltraitdata.github.io/TraitDataList/Antenna_length"),
    Front.Tibia_length = as.trait("Front.Tibia_length", identifier = "t13",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of the tibia of the foreleg"),
    Mid.Tibia_length = as.trait("Mid.Tibia_length", identifier = "t14",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of the tibia of the mid leg",
                            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Tibia_length"),
    Hind.Tibia_length = as.trait("Hind.Tibia_length", identifier = "t15",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of the tibia of the hind leg",
                            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Tibia_length"),
    Front.Femur_length = as.trait("Front.Femur_length", identifier = "t16",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of the femur of the foreleg",
                            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length"),
    Hind.Femur_length = as.trait("Hind.Femur_length", identifier = "t17",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of the femur of the hind leg",
                            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length"),
    Front.Femur_width = as.trait("Front.Femur_width", identifier = "t18",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Width of the femur of the foreleg"),
    Hind.Femur_width = as.trait("Hind.Femur_width", identifier = "t18",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Width of the femur of the hind leg"),
    Rostrum_length = as.trait("Rostrum_length", identifier = "t19",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Length of the rostrum including all segments"),
    Rostrum_width = as.trait("Rostrum_width", identifier = "t20",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Widest part of the rostrum"),
    Wing_length = as.trait("Wing_length", identifier = "t21",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Longest part of the forewing",
                            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Wing"),
    Wing_width = as.trait("Wing_width", identifier = "t22",
                            expectedUnit = "mm", valueType = "numeric",
                            traitDescription = "Widest part of the forewing",
                            broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Wing")
  )


## ---- message=FALSE, warning=FALSE---------------------------------------
dataset2Std <- standardize_traits(dataset2, thesaurus2)
subset(dataset2Std, occurrenceID == 2)

attributes(dataset2Std)$traits[,c("trait", "identifier","traitDescription","expectedUnit")]

## ---- message=FALSE, warning=FALSE---------------------------------------
dataset1Std <- standardize_taxa(dataset1)
head(dataset1Std)


## ---- eval = FALSE-------------------------------------------------------
#  # dataset by Jule Mangels et al.
#  
#  moths <- read.service(21247, dec = ",")
#  
#  dataset5 <- as.traitdata(moths, taxa = "species", traits = c(body_mass =
#       "weight", wing_length = "wing_length", wing_width = "wing_width", wing_area =
#       "wing_area", wing_loading = "wing_loading"),
#     keep = c(locationID = "plot"))
#  
#  dataset5Std <- standardize.exploratories(dataset1)
#  
#  head(dataset5Std)

## ---- message = FALSE, warning=FALSE, eval=FALSE-------------------------
#  dataset1Std <- standardize(carabids,
#              thesaurus = thesaurus1,
#              taxa = "name_correct",
#              units = "mm",
#              keep = c(measurementDeterminedBy = "source_measurement")
#              )

## ---- eval = FALSE-------------------------------------------------------
#  newdata <- rbind(dataset1Std, dataset2Std,
#                  datasetID = c("vanderplas15", "gossner15")
#                )

## ------------------------------------------------------------------------
metadata1 <- as.metadata(
      datasetName = "Carabid traits",
      datasetID = "carabids",
      bibliographicCitation =  bibentry(
        bibtype = "Article",
        title = "Sensitivity of functional diversity metrics to sampling intensity",
        journal = "Methods in Ecology and Evolution",
        author = c(as.person("Fons van der Plas, Roel van Klink, Pete Manning, Han Olff, Markus Fischer")
        ),
        year = 2017,
        doi = "10.1111/2041-210x.12728"
      ),
      author = "Fons van der Plas",
      license = "http://creativecommons.org/publicdomain/zero/1.0/"
       )

dataset1 <- as.traitdata(carabids,
  taxa = "name_correct",
  thesaurus = thesaurus1,
  units = "mm",
  keep = c(datasetID = "source_measurement", measurementRemark = "note"),
  metadata = metadata1
)

head(dataset1)

## ------------------------------------------------------------------------
metadata2 <- as.metadata(
  datasetName = "Heteroptera morphometry traits",
  datasetID = "heteroptera",
  bibliographicCitation =  bibentry(
    bibtype = "Article",
    title = "Morphometric measures of Heteroptera sampled in grasslands across three regions of Germany",
    journal = "Ecology",
    volume = 96,
    issue = 4,
    pages = 1154,
    author = c(as.person("Martin M. Gossner , Nadja K. Simons, Leonhard Hoeck, Wolfgang W. Weisser")),
    year = 2015,
    doi = "10.1890/14-2159.1"
  ),
  author = "Martin M. Gossner",
  license = "http://creativecommons.org/publicdomain/zero/1.0/"
)

dataset2 <- as.traitdata(heteroptera_raw,
  taxa = "SpeciesID",
  thesaurus = thesaurus2,
  units = "mm",
  keep = c(sex = "Sex", references = "Source", lifestage = "Wing_development"),
  metadata =  metadata2
)

database <- rbind(dataset1, dataset2, 
                datasetID = c("vanderplas17", "gossner15"), 
                metadata_as_columns = TRUE
                ) 

head(database)

## ------------------------------------------------------------------------
attributes(dataset1)$metadata$bibliographicCitation

## ---- eval = FALSE-------------------------------------------------------
#  carabids <- utils::read.delim(url("https://datadryad.org/bitstream/handle/10255/dryad.134418/carabid%20traits%20final.txt",
#                                  encoding = "UTF-8")
#                                )
#  
#  attr(carabids, 'metadata') <- traitdataform::as.metadata(
#        datasetName = "Carabid traits",
#        datasetID = "carabids",
#        bibliographicCitation =  utils::bibentry(
#          bibtype = "Article",
#          title = "Sensitivity of functional diversity metrics to sampling intensity",
#          journal = "Methods in Ecology and Evolution",
#          author = c(utils::as.person("Fons van der Plas, Roel van Klink, Pete Manning, Han Olff, Markus Fischer")
#          ),
#          year = 2017,
#          doi = "10.1111/2041-210x.12728"
#        ),
#        author = "Fons van der Plas",
#        license = "http://creativecommons.org/publicdomain/zero/1.0/"
#         )
#  
#  attr(carabids, 'thesaurus') <-  traitdataform:::as.thesaurus(
#            body_length = traitdataform:::as.trait("body_length",
#                                expectedUnit = "mm", valueType = "numeric",
#                                identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length"),
#            antenna_length = traitdataform:::as.trait("antenna_length",
#                                expectedUnit = "mm", valueType = "numeric",
#                                identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length"),
#            metafemur_length = traitdataform:::as.trait("femur_length",
#                                expectedUnit = "mm", valueType = "numeric",
#                                identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length"),
#            eyewidth_corr = traitdataform:::as.trait("eye_diameter",
#                                expectedUnit = "mm", valueType = "numeric",
#                                identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Eye_diameter")
#          )
#  
#  attr(carabids, 'taxa') <- "name_correct"
#  attr(carabids, 'units') <- "mm"
#  attr(carabids, 'keep') <-  c(measurementDeterminedBy = "source_measurement", measurementRemarks = "note")
#  

## ------------------------------------------------------------------------
#example for adding metadata as a table


## ---- eval = FALSE-------------------------------------------------------
#  
#  head(dataset3)
#  
#  dataset3wide <- cast.traitdata(dataset3)
#  
#  head(dataset3wide)
#  

## ---- eval = FALSE-------------------------------------------------------
#  write.table(dataset1Std, file = "carabids_std.csv",
#              sep = ",", dec = ".", quote = TRUE, eol = "\r", row.names = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  capture.output(attributes(dataset1Std)$metadata, file = "metadata.txt")
#  
#  write.table(attributes(dataset1Std)$traits, file = "traits.csv",
#              sep = ",", dec = ".", quote = TRUE, eol = "\r", row.names = FALSE)
#  write.table(attributes(dataset1Std)$taxonomy, file = "taxa.csv",
#              sep = ",", dec = ".", quote = TRUE, eol = "\r", row.names = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  zip("carabids_std.zip", c("carabids_std.csv", "metadata.txt", "traits.csv", "taxa.csv") )

