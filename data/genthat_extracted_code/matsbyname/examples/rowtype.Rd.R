library(matsbyname)


### Name: rowtype
### Title: Row type
### Aliases: rowtype

### ** Examples

library(dplyr)
commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
  setrowtype(rowtype = "Commodities") %>% setcoltype("Industries")
rowtype(U)
# This also works for lists
rowtype(list(U,U))



