library(tbl2xts)


### Name: tbl_xts
### Title: tbl_xts
### Aliases: tbl_xts

### ** Examples

library(dplyr)
library(tbl2xts)
data(TRI)
tbl_xts(TRI, cols_to_xts = "TRI", spread_by = "Country")



