library(valr)


### Name: bed_coverage
### Title: Compute coverage of intervals.
### Aliases: bed_coverage

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end, ~strand,
  "chr1", 100,    500,  '+',
  "chr2", 200,    400,  '+',
  "chr2", 300,    500,  '-',
  "chr2", 800,    900,  '-'
)

y <- trbl_interval(
  ~chrom, ~start, ~end, ~value, ~strand,
  "chr1", 150,    400,  100,    '+',
  "chr1", 500,    550,  100,    '+',
  "chr2", 230,    430,  200,    '-',
  "chr2", 350,    430,  300,    '-'
)

bed_coverage(x, y)




