library(NSO1212)


### Name: get_table_info
### Title: Detailed Information about a Table and Its Classification on the
###   API opendata.1212.mn
### Aliases: get_table_info

### ** Examples

table_info <- get_table_info("DT_NSO_2400_015V2")
table_info$unit_nm
table_info$obj[[1]]$itm[[1]]$scr_mn



