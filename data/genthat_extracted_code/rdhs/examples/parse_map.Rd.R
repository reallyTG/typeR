library(rdhs)


### Name: parse_map
### Title: Create dictionary from DHS .MAP codebook
### Aliases: parse_map

### ** Examples

mrdt_zip <- tempfile()
download.file(
paste0(
"https://dhsprogram.com/customcf/legacy/data/sample_download_dataset.cfm",
"?Filename=ZZMR61DT.ZIP&Tp=1&Ctry_Code=zz&survey_id=0&doctype=dhs"),
mrdt_zip, mode="wb"
)

map <- rdhs::read_zipdata(mrdt_zip, "\\.MAP", readLines)
dct <- rdhs:::parse_map(map)




