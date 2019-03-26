library(CrossVA)


### Name: odk2openVA
### Title: Map VA records to InterVA5 & InSilico (with option data.type =
###   "WHO2016").
### Aliases: odk2openVA

### ** Examples

## Not run: 
##D ## Example with 2016 WHO VA instrument version 1.5.1
##D record_f_name151 <- system.file("sample", "who151_odk_export.csv", package = "CrossVA")
##D records151 <- read.csv(record_f_name151, stringsAsFactors = FALSE)
##D output151 <- odk2openVA(records151, version = "1.5.1")
##D 
##D ## Example with 2016 WHO VA instrument version 1.4.1
##D record_f_name141 <- system.file("sample", "who141_odk_export.csv", package = "CrossVA")
##D records141 <- read.csv(record_f_name141, stringsAsFactors = FALSE)
##D output141 <- odk2openVA(records, version = "1.4.1")
## End(Not run)




