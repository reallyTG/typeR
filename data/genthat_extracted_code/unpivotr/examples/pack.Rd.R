library(unpivotr)


### Name: pack
### Title: Pack cell values from separate columns per data type into one
###   list-column
### Aliases: pack unpack

### ** Examples

# A normal data frame
w <- data.frame(foo = 1:2,
                bar = c("a", "b"),
                stringsAsFactors = FALSE)
w

# The same data, represented by one row per cell, with integer values in the
# `int` column and character values in the `chr` column.
x <- as_cells(w)
x

# pack() and unpack() are complements
pack(x)
unpack(pack(x))

# Drop non-data columns from a wide data frame of cells from tidyxl
if (require(tidyxl)) {
  cells <- tidyxl::xlsx_cells(system.file("extdata", "purpose.xlsx", package = "unpivotr"))
  cells

  pack(cells) %>%
    dplyr::select(row, col, value) %>%
    unpack()
}



