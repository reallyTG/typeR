library(tbltools)


### Name: as_tbl
### Title: as_tbl
### Aliases: as_tbl

### ** Examples

## data with row names
d <- data.frame(x = rnorm(5), y = rnorm(5), row.names = letters[1:5])

## convert to tibble
as_tbl(d)

## convert to tibble and create row_names variable
as_tbl(d, row_names = TRUE)




