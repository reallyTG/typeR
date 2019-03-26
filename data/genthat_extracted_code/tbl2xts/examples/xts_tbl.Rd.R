library(tbl2xts)


### Name: xts_tbl
### Title: xts_tbl
### Aliases: xts_tbl

### ** Examples

library(dplyr)
data(TRI)
TRI %>% tbl_xts(., cols_to_xts = "TRI", spread_by = "Country") %>% xts_tbl()



