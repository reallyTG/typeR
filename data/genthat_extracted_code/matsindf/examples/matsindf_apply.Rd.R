library(matsindf)


### Name: matsindf_apply
### Title: Apply a function to a 'matsindf' data frame (and more)
### Aliases: matsindf_apply

### ** Examples

library(matsbyname)
example_fun <- function(a, b){
  return(list(c = sum_byname(a, b), d = difference_byname(a, b)))
}
# Single values for arguments
matsindf_apply(FUN = example_fun, a = 2, b = 2)
# Matrices for arguments
a <- 2 * matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE,
              dimnames = list(c("r1", "r2"), c("c1", "c2")))
b <- 0.5 * a
matsindf_apply(FUN = example_fun, a = a, b = b)
# Single values in lists are treated like columns of a data frame
matsindf_apply(FUN = example_fun, a = list(2, 2), b = list(1, 2))
# Matrices in lists are treated like columns of a data frame
matsindf_apply(FUN = example_fun, a = list(a, a), b = list(b, b))
# Single numbers in a data frame
DF <- data.frame(a = c(4, 4, 5), b = c(4, 4, 4))
matsindf_apply(DF, FUN = example_fun, a = "a", b = "b")
# By default, arguments to FUN come from DF
matsindf_apply(DF, FUN = example_fun)
# Matrices in data frames (matsindf)
DF2 <- data.frame(a = I(list(a, a)), b = I(list(b,b)))
matsindf_apply(DF2, FUN = example_fun, a = "a", b = "b")
# All arguments to FUN are supplied by named items in .dat
matsindf_apply(list(a = 1, b = 2), FUN = example_fun)
# All arguments are supplied by named arguments in ..., but mix them up.
# Note that the named arguments override the items in .dat
matsindf_apply(list(a = 1, b = 2, z = 10), FUN = example_fun, a = "z", b = "b")
# Warning is issued when an output item has same name as an input item.
## Not run: matsindf_apply(list(a = 1, b = 2, c = 10), FUN = example_fun, a = "c", b = "b")



