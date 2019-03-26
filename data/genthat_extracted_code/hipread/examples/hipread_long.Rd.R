library(hipread)


### Name: hipread_long
### Title: Read a hierarchical fixed width data file
### Aliases: hipread_long hipread_list

### ** Examples

# Read an example hierarchical data.frame into long format
data <- hipread_long(
  hipread_example("test-basic.dat"),
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

# Read an example hierarchical data.frame into list format
data <- hipread_list(
  hipread_example("test-basic.dat"),
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

# Read a rectangular data.frame
data_rect <- hipread_long(
  hipread_example("test-basic.dat"),
  hip_fwf_positions(
    c(1, 2),
    c(1, 4),
    c("rt", "hhnum"),
    c("c", "i")
  )
)



