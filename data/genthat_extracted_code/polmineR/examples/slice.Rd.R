library(polmineR)


### Name: slice
### Title: Virtual class clice.
### Aliases: slice slice-class aggregate,slice-method

### ** Examples

P <- new(
  "partition",
  cpos = matrix(data = c(1:10, 20:29), ncol = 2, byrow = TRUE),
  stat = data.table::data.table()
)
P2 <- aggregate(P)
P2@cpos



