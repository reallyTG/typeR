library(readr)


### Name: melt_delim_chunked
### Title: Melt a delimited file by chunks
### Aliases: melt_delim_chunked melt_csv_chunked melt_csv2_chunked
###   melt_tsv_chunked
### Keywords: internal

### ** Examples

# Cars with 3 gears
f <- function(x, pos) subset(x, data_type == "integer")
melt_csv_chunked(readr_example("mtcars.csv"), DataFrameCallback$new(f), chunk_size = 5)



