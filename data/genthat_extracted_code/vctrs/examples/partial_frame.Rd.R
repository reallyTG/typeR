library(vctrs)


### Name: partial_frame
### Title: Partially specify columns of a data frame
### Aliases: partial_frame

### ** Examples

pf <- partial_frame(x = double())
pf

vec_rbind(
  data.frame(x = 1L, y = "a"),
  data.frame(x = FALSE, z = 10),
  .ptype = partial_frame(x = double(), a = character())
)



