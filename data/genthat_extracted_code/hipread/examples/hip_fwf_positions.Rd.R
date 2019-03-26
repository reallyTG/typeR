library(hipread)


### Name: hip_fwf_positions
### Title: Specify column-specific options for hipread
### Aliases: hip_fwf_positions hip_fwf_widths

### ** Examples

# 3 Columns, specified by position
hip_fwf_positions(
  c(1, 3, 7),
  c(2, 6, 10),
  c("Var1", "Var2", "Var3"),
  c("c", "i", "d")
)

# The same 3 columns, specified by width
hip_fwf_widths(
  c(2, 4, 4),
  c("Var1", "Var2", "Var3"),
  c("c", "i", "d")
)




