library(matsindf)


### Name: expand_to_tidy
### Title: Expand a "tidy" data frame with matsindf-style matrices to a
###   "tidy" data frame with each matrix entry as an observation
### Aliases: expand_to_tidy

### ** Examples

library(dplyr)
library(matsbyname)
ptype <- "Products"
itype <- "Industries"
tidy <- data.frame(Country  = c( "GH",  "GH",  "GH",  "GH",  "GH",  "GH",  "GH",
                                 "US",  "US",  "US",  "US", "GH", "US"),
                  Year      = c( 1971,  1971,  1971,  1971,  1971,  1971,  1971,
                                 1980,  1980,  1980,  1980, 1971, 1980),
                  matrix    = c(  "U",   "U",   "Y",   "Y",   "Y",   "V",   "V",
                                  "U",   "U",   "Y",   "Y", "eta", "eta"),
                  row       = c(  "c1",  "c2",  "c1",  "c2",  "c2",  "i1",  "i2",
                                  "c1",  "c1",  "c1",  "c2", NA, NA),
                  col       = c(  "i1",  "i2",  "i1",  "i2",  "i3",  "c1",  "c2",
                                  "i1",  "i2",  "i1",  "i2", NA, NA),
                  rowtypes  = c( ptype, ptype, ptype, ptype, ptype, itype, itype,
                                 ptype, ptype, ptype, ptype, NA, NA),
                  coltypes  = c(itype, itype, itype, itype, itype, ptype, ptype,
                                itype, itype, itype, itype, NA, NA),
                  vals  = c(    11  ,  22,    11 ,   22 ,   23 ,   11 ,   22 ,
                                11 ,   12 ,   11 ,   22,   0.2, 0.3)) %>%
  group_by(Country, Year, matrix)
mats <- collapse_to_matrices(tidy, matnames = "matrix", rownames = "row", colnames = "col",
                             rowtypes = "rowtypes", coltypes = "coltypes",
                             matvals = "vals") %>%
  ungroup()
expand_to_tidy(mats, matnames = "matrix", matvals = "vals",
                     rownames = "rows", colnames = "cols",
                     rowtypes = "rt",   coltypes = "ct")
expand_to_tidy(mats, matnames = "matrix", matvals = "vals",
                     rownames = "rows", colnames = "cols",
                     rowtypes = "rt",   coltypes = "ct", drop = 0)



