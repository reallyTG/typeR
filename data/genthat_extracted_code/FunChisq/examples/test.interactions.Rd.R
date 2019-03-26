library(FunChisq)


### Name: test.interactions
### Title: Fast Test of Directional Interactions by Functional Chi-Squares
### Aliases: test.interactions
### Keywords: htest nonparametric

### ** Examples

x <- matrix(
  c(0,0,1,0,1,
    1,0,2,1,0,
    2,2,0,0,0,
    1,2,1,1,2,
    1,0,2,1,2),
  nrow = 5, ncol = 5, byrow = TRUE)

list.ind.vars <-list(
  c(1),c(1),c(1),
  c(2),c(2),c(2),
  c(1,2), c(2,3),
  c(3,4), c(4,5))
dep.vars <- c(
  3,4,5,
  3,4,5,
  3,4,
  5,1)

# list.ind.vars and dep.vars together specify
#   the following ten interactions:
#   1 -> 3
#   1 -> 4
#   1 -> 5
#   2 -> 3
#   2 -> 4
#   2 -> 5
# 1,2 -> 3
# 2,3 -> 4
# 3,4 -> 5
# 4,5 -> 1

var.names <- paste0("var", 1:5)

test.interactions(
  x = x,
  list.ind.vars = list.ind.vars,
  dep.vars = dep.vars,
  var.names = var.names,
  index.kind = "unconditional")



