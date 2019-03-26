library(hipread)


### Name: hipread_long_chunked
### Title: Read a hierarchical fixed width data file, in chunks
### Aliases: hipread_long_chunked hipread_list_chunked

### ** Examples

# Read in a data, filtering out hhnum == "002"
data <- hipread_long_chunked(
  hipread_example("test-basic.dat"),
  HipDataFrameCallback$new(function(x, pos) x[x$hhnum != 2, ]),
  4,
  list(
    H = hip_fwf_positions(
      c(1, 2, 5, 8),
      c(1, 4, 7, 10),
      c("rt", "hhnum", "hh_char", "hh_dbl"),
      c("c", "i", "c", "d")
    ),
    P = hip_fwf_widths(
      c(1, 3, 1, 3, 1),
      c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
      c("c", "i", "i", "d", "c")
    )
  ),
  hip_rt(1, 1)
)



