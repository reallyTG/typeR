library(valr)


### Name: bed_partition
### Title: Partition intervals into elemental intervals
### Aliases: bed_partition

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end, ~value, ~strand,
 'chr1', 100,    500,  10, "+",
 'chr1', 200,    400,  20, "-",
 'chr1', 300,    550,  30, "+",
 'chr1', 550,    575,   2, "+",
 'chr1', 800,    900,   5, "+" )


bed_glyph(bed_partition(x))
bed_glyph(bed_partition(x, value = sum(value)), label = "value")

bed_partition(x)

# compute summary over each elemental interval
bed_partition(x, value = sum(value))

# partition and compute summaries based on group
x <- dplyr::group_by(x, strand)
bed_partition(x, value = sum(value))

# combine values across multiple tibbles
y <- trbl_interval(
  ~chrom, ~start, ~end, ~value, ~strand,
 'chr1', 10,     500,  100, "+",
 'chr1', 250,    420,  200, "-",
 'chr1', 350,    550,  300, "+",
 'chr1', 550,    555,   20, "+",
 'chr1', 800,    900,   50, "+" )

x <- dplyr::bind_rows(x, y)
bed_partition(x, value = sum(value))




