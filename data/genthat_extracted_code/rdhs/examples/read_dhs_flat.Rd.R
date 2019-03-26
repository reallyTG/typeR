library(rdhs)


### Name: read_dhs_flat
### Title: Read DHS flat file data set
### Aliases: read_dhs_flat

### ** Examples

mrfl_zip <- tempfile()
download.file(
paste0(
"https://dhsprogram.com/customcf/legacy/data/sample_download_dataset.cfm?",
"Filename=ZZMR61FL.ZIP&Tp=1&Ctry_Code=zz&survey_id=0&doctype=dhs"),
mrfl_zip,mode="wb"
)

mr <- rdhs:::read_dhs_flat(mrfl_zip)
attr(mr$mv213, "label")
class(mr$mv213)
head(mr$mv213)
table(mr$mv213)
table(haven::as_factor(mr$mv213))




