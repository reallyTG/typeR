library(sjmisc)


### Name: var_rename
### Title: Rename variables
### Aliases: var_rename

### ** Examples

dummy <- data.frame(
  a = sample(1:4, 10, replace = TRUE),
  b = sample(1:4, 10, replace = TRUE),
  c = sample(1:4, 10, replace = TRUE)
)

var_rename(dummy, a = "first.col", c = "3rd.col")

# using quasi-quotation
library(rlang)
v1 <- "first.col"
v2 <- "3rd.col"
var_rename(dummy, a = !!v1, c = !!v2)

x1 <- "a"
x2 <- "b"
var_rename(dummy, !!x1 := !!v1, !!x2 := !!v2)




