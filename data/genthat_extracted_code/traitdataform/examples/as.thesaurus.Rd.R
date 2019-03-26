library(traitdataform)


### Name: as.thesaurus
### Title: Create a list of trait definitions (a thesaurus of traits)
### Aliases: as.thesaurus

### ** Examples


# provide traitlist by defining individual traits using function `as.trait()`:

traitlist <- as.thesaurus(body_length = as.trait("body_length", expectedUnit = "mm", 
    valueType = "numeric", 
    identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length"), 
  antenna_length = as.trait("antenna_length", expectedUnit = "mm", 
    valueType = "numeric", 
    identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length"),
  metafemur_length = as.trait("metafemur_length", expectedUnit = "mm", 
    valueType = "numeric", 
    identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length")
)

# provide traitlist from data frame object: 

as.thesaurus(data.frame(
  trait = c("body_length", "antenna_length", "metafemur_length", "eyewidth_corr"),
  expectedUnit = "mm",
  valueType = "numeric",
  traitDescription = c("body length in mm", "length of antenna in mm", 
                              "length of metafemur in mm", "eye width in mm"), 
  identifier = c("http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length", 
    "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Antenna_length", 
    "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Femur_length", 
    "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Eye_diameter"
    )
)
)

# provide traitlist from remote archive with renaming  
# (pulls from https://github.com/EcologicalTraitData/TraitDataList)

## Not run: 
##D traits1 <- as.thesaurus(read.csv("https://git.io/fpsj5"), 
##D                    replace = c(traitID = "identifier", 
##D                                   traitName = "trait",
##D                                   traitUnit = "expectedUnit",
##D                                   Comments = "comments") 
##D )
## End(Not run)



