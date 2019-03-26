library(matsindf)


### Name: collapse_to_matrices
### Title: Collapse a "tidy" data frame to matrices in a data frame
###   ('matsindf')
### Aliases: collapse_to_matrices

### ** Examples

library(dplyr)
library(tidyr)
library(tibble)
ptype <- "Products"
itype <- "Industries"
tidy <- data.frame(Country = c( "GH",  "GH",  "GH",  "GH",  "GH",  "GH",  "GH",
                                "US",  "US",  "US",  "US", "GH", "US"),
                  Year    = c(  1971,  1971,  1971,  1971,  1971,  1971,  1971,
                                1980,  1980,  1980,  1980, 1971, 1980),
                  matrix  = c(   "U",   "U",   "E",   "E",   "E",   "V",   "V",
                                 "U",   "U",   "E",   "E", "eta", "eta"),
                  row     = c( "c 1", "c 2", "c 1", "c 2", "c 2", "i 1", "i 2",
                               "c 1", "c 1", "c 1", "c 2", NA, NA),
                  col     = c( "i 1", "i 2", "i 1", "i 2", "i 3", "c 1", "c 2",
                               "i 1", "i 2", "i 1", "i 2", NA, NA),
                  rowtypes = c( ptype, ptype, ptype, ptype, ptype, itype, itype,
                                ptype, ptype, ptype, ptype, NA, NA),
                  coltypes = c( itype, itype, itype, itype, itype, ptype, ptype,
                                itype, itype, itype, itype, NA, NA),
                  vals  = c(    11  ,  22,    11 ,   22 ,   23 ,   11 ,   22 ,
                                11 ,   12 ,   11 ,   22,   0.2, 0.3)
) %>% group_by(Country, Year, matrix)
mats <- collapse_to_matrices(tidy, matnames = "matrix", matvals = "vals",
                             rownames = "row", colnames = "col",
                             rowtypes = "rowtypes", coltypes = "coltypes")
mats %>% spread(key = matrix, value = vals)



