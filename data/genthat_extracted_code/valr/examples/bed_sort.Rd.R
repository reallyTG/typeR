library(valr)


### Name: bed_sort
### Title: Sort a set of intervals.
### Aliases: bed_sort

### ** Examples

x <- trbl_interval(
   ~chrom, ~start, ~end,
   "chr8", 500,    1000,
   "chr8", 1000,   5000,
   "chr8", 100,    200,
   "chr1", 100,    300,
   "chr1", 100,    200
)

# sort by chrom and start
bed_sort(x)

# reverse sort order
bed_sort(x, reverse = TRUE)

# sort by interval size
bed_sort(x, by_size = TRUE)

# sort by decreasing interval size
bed_sort(x, by_size = TRUE, reverse = TRUE)

# sort by interval size within chrom
bed_sort(x, by_size = TRUE, by_chrom = TRUE)




