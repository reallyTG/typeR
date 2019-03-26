library(readr)


### Name: read_delim_chunked
### Title: Read a delimited file by chunks
### Aliases: read_delim_chunked read_csv_chunked read_csv2_chunked
###   read_tsv_chunked
### Keywords: internal

### ** Examples

# Cars with 3 gears
f <- function(x, pos) subset(x, gear == 3)
read_csv_chunked(readr_example("mtcars.csv"), DataFrameCallback$new(f), chunk_size = 5)



