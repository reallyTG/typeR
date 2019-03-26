library(NSO1212)


### Name: get_table
### Title: Download Statistical Data from the API opendata.1212.mn
### Aliases: get_table

### ** Examples

nso.data <- get_table(
  tbl_id = "DT_NSO_2400_015V2",
  PERIOD = c("201711", "201712", "201801"),
  CODE = c("10", "11"),
  CODE1 = "11"
)
print(nso.data)



