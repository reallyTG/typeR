library(rdhs)


### Name: parse_meta
### Title: Parse fixed-width file metadata
### Aliases: parse_meta parse_dcf parse_sps parse_do

### ** Examples

mrfl_zip <- tempfile()
download.file(
paste0(
"https://dhsprogram.com/customcf/legacy/data/sample_download_dataset.cfm?",
"Filename=ZZMR61FL.ZIP&Tp=1&Ctry_Code=zz&survey_id=0&doctype=dhs"),
mrfl_zip, mode="wb"
)

dcf <- rdhs::read_zipdata(mrfl_zip, "\\.DCF", readLines)
dct <- rdhs:::parse_dcf(dcf)

sps <- rdhs::read_zipdata(mrfl_zip, "\\.SPS", readLines)
dct <- rdhs:::parse_sps(sps)

do <- rdhs::read_zipdata(mrfl_zip, "\\.DO", readLines)
dctin <- rdhs::read_zipdata(mrfl_zip, "\\.DCT", readLines)
dct <- rdhs:::parse_do(do, dctin)




