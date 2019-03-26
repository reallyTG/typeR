library(kntnr)


### Name: kntn_parse
### Title: Parse 'kintone' API Response
### Aliases: kntn_parse kntn_parse_records kntn_parse_record kntn_parse_col
### Keywords: internal

### ** Examples

library(jsonlite)

rcd_file <- system.file("extdata/record.json", package = "kntnr")
rcd <- fromJSON(rcd_file, simplifyVector = FALSE)$record
kntnr:::kntn_parse_record(rcd)

rcds_file <- system.file("extdata/records.json", package = "kntnr")
rcds <- jsonlite::fromJSON(rcds_file, simplifyVector = FALSE)$records
kntnr:::kntn_parse_records(rcds)




