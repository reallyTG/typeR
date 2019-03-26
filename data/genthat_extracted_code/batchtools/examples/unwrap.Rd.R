library(batchtools)


### Name: unwrap
### Title: Unwrap Nested Data Frames
### Aliases: unwrap flatten

### ** Examples

x = data.table(
  id = 1:3,
  values = list(list(a = 1, b = 3), list(a = 2, b = 2), list(a = 3))
)
unwrap(x)
unwrap(x, sep = ".")



