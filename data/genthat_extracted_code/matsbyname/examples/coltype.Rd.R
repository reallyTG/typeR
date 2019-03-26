library(matsbyname)


### Name: coltype
### Title: Column type
### Aliases: coltype

### ** Examples

commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
  setrowtype(rowtype = "Commodities") %>% setcoltype("Industries")
coltype(U)
# This also works for lists
coltype(list(U,U))



