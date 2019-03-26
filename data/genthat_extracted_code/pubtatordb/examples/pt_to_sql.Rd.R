library(pubtatordb)


### Name: pt_to_sql
### Title: Create sqlite database from the pubtator data.
### Aliases: pt_to_sql

### ** Examples

## No test: 
download_path <- tempdir()
current_dir <- getwd()
setwd(download_path)
pt_to_sql("PubTator")
setwd(current_dir)
## End(No test)



