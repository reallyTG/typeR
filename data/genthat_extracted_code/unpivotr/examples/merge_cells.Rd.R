library(unpivotr)


### Name: merge_cells
### Title: Merge cell values into a single cell by rows or columns
### Aliases: merge_cells merge_rows merge_cols

### ** Examples

 x <- tibble::tribble(
~row, ~col, ~data_type,     ~chr,
   1,    1,      "chr",   "Katy",
   2,    1,      "chr",  "Perry",
   3,    1,      "chr",      "a",
   4,    1,      "chr",      "b",
   5,    1,      "chr",      "c",
   2,    2,      "chr",  "Adele",
   3,    2,      "chr",      "d",
   4,    2,      "chr",      "e",
   5,    2,      "chr",      "f",
   1,    3,      "chr", "Ariana",
   2,    3,      "chr", "Grande",
   3,    3,      "chr",      "g",
   4,    3,      "chr",      "h",
   5,    3,      "chr",      "i"
)
rectify(x)
y <- merge_rows(x, 1:2, chr)
rectify(y)
z <- merge_cols(x, 1:2, chr)
rectify(z)



