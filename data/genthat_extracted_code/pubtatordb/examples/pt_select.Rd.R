library(pubtatordb)


### Name: pt_select
### Title: Retrieve data from the PubTator database.
### Aliases: pt_select

### ** Examples

## No test: 
db_con <- pt_connector(pt_path)
pt_select(
  db_con,
  "gene",
  columns = c("ENTREZID","Resource","MENTIONS","PMID"),
  keys = c("7356", "4199", "7018"),
  keytype = "ENTREZID",
  limit = 10
)
## End(No test)



