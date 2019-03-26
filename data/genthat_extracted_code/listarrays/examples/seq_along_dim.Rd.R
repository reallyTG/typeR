library(listarrays)


### Name: seq_along_dim
### Title: Sequence along a dimension
### Aliases: seq_along_dim seq_along_rows seq_along_cols

### ** Examples

for (r in seq_along_rows(mtcars[1:4,]))
  print(mtcars[r,])

x <- 1:3
identical(seq_along_rows(x), seq_along(x))




