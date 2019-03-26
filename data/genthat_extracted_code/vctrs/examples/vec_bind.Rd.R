library(vctrs)


### Name: vec_bind
### Title: Combine many data frames into one data frame
### Aliases: vec_bind vec_rbind vec_cbind

### ** Examples

# row binding -----------------------------------------

# common columns are coerced to common class
vec_rbind(
  data.frame(x = 1),
  data.frame(x = FALSE)
)

# unique columns are filled with NAs
vec_rbind(
  data.frame(x = 1),
  data.frame(y = "x")
)

# null inputs are ignored
vec_rbind(
  data.frame(x = 1),
  NULL,
  data.frame(x = 2)
)

# bare vectors are treated as rows
vec_rbind(
  c(x = 1, y = 2),
  c(x = 3)
)

# default names will be supplied if arguments are not named
vec_rbind(
  1:2,
  1:3,
  1:4
)

# column binding --------------------------------------

# each input is recycled to have common length
vec_cbind(
  data.frame(x = 1),
  data.frame(y = 1:3)
)

# bare vectors are treated as columns
vec_cbind(
  data.frame(x = 1),
  y = letters[1:3]
)

# outer names are combined with inner names
vec_cbind(
  x = data.frame(a = 1, b = 2),
  y = 1
)

# duplicate names are flagged
vec_cbind(x = 1, x = 2)




