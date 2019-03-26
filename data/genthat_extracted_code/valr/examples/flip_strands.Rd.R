library(valr)


### Name: flip_strands
### Title: Flip strands in intervals.
### Aliases: flip_strands

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end, ~strand,
  'chr1', 1,      100,  '+',
  'chr2', 1,      100,  '-'
)

flip_strands(x)




