library(matsindf)


### Name: mat_to_rowcolval
### Title: Convert a matrix to a data frame with rows, columns, and values.
### Aliases: mat_to_rowcolval

### ** Examples

library(matsbyname)
data <- data.frame(Country  = c("GH", "GH", "GH"),
                   rows = c( "c1",  "c1", "c2"),
                   cols = c( "i1",  "i2", "i2"),
                   rt = c("Commodities", "Commodities", "Commodities"),
                   ct = c("Industries", "Industries", "Industries"),
                   vals = c(  11  ,  12,   22 ))
data
A <- data %>%
  rowcolval_to_mat(rownames = "rows", colnames = "cols",
                   rowtypes = "rt",   coltypes = "ct", matvals = "vals")
A
mat_to_rowcolval(A, rownames = "rows", colnames = "cols",
                 rowtypes = "rt", coltypes = "ct", matvals = "vals")
mat_to_rowcolval(A, rownames = "rows", colnames = "cols",
                 rowtypes = "rt", coltypes = "ct", matvals = "vals", drop = 0)
# This also works for single values
mat_to_rowcolval(2, matvals = "vals",
                 rownames = "rows", colnames = "cols",
                 rowtypes = "rt", coltypes = "ct")
mat_to_rowcolval(0, matvals = "vals",
                 rownames = "rows", colnames = "cols",
                 rowtypes = "rt", coltypes = "ct", drop = 0)



