library(rdhs)


### Name: read_dhs_dta
### Title: Read DHS Stata data set
### Aliases: read_dhs_dta

### ** Examples

mrdt_zip <- tempfile()
download.file(
paste0(
"https://dhsprogram.com/customcf/legacy/data/sample_download_dataset.cfm?",
"Filename=ZZMR61DT.ZIP&Tp=1&Ctry_Code=zz&survey_id=0&doctype=dhs"),
mrdt_zip, mode="wb"
)

mr <- rdhs::read_dhs_dta(mrdt_zip,mode="map")
attr(mr$mv213, "label")
class(mr$mv213)
head(mr$mv213)
table(mr$mv213)
table(haven::as_factor(mr$mv213))

## If Stata file codebook is complete, `mode="map"` and `"haven"`
## should be the same.
mr_hav <- rdhs::read_dhs_dta(mrdt_zip, mode="haven")
attr(mr_hav$mv213, "label")
class(mr_hav$mv213)
head(mr_hav$mv213)  # "9=missing" omitted from .dta codebook
table(mr_hav$mv213)
table(haven::as_factor(mr_hav$mv213))

## Parsing codebook when using foreign::read.dta()
# foreign issues with duplicated factors
# Specifying foreignNA can help but often will not as below.
# Thus we would recommend either using mode = "haven" or mode = "raw"
## Not run: 
##D mr_for <- rdhs::read_dhs_dta(mrdt_zip, mode="foreign")
##D mr_for <- rdhs::read_dhs_dta(mrdt_zip, mode = "foreignNA")
## End(Not run)
## Don't convert factors
mr_raw <- rdhs::read_dhs_dta(mrdt_zip, mode="raw")
table(mr_raw$mv213)




