library(valr)


### Name: bed_makewindows
### Title: Divide intervals into new sub-intervals ("windows").
### Aliases: bed_makewindows

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end, ~name, ~score, ~strand,
  "chr1", 100,    200,  'A',   '.',    '+'
)

bed_glyph(bed_makewindows(x, num_win = 10), label = '.win_id')

# Fixed number of windows
bed_makewindows(x, num_win = 10)

# Fixed window size
bed_makewindows(x, win_size = 10)

# Fixed window size with overlaps
bed_makewindows(x, win_size = 10, step_size = 5)

# reverse win_id
bed_makewindows(x, win_size = 10, reverse = TRUE)

# bedtools 'namenum'
wins <- bed_makewindows(x, win_size = 10)
dplyr::mutate(wins, namenum = stringr::str_c(name, '_', .win_id))




