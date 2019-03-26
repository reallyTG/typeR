library(listarrays)


### Name: set_dimnames
### Title: Set dimnames
### Aliases: set_dimnames

### ** Examples

x <- array(1:8, 2:4)

# to set axis names, leave which_dim=NULL and pass a character vector
dimnames(set_dimnames(x, c("a", "b", "c")))

# to set names along a single axis, specify which_dim
dimnames(set_dimnames(x, c("a", "b", "c"), 2))

# to set an axis name and names along the axis, pass a named list
dimnames(set_dimnames(x, list(axis2 = c("a", "b", "c")), 2))
dimnames(set_dimnames(x, list(axis2 = c("a", "b", "c"),
                              axis3 = 1:4), which_dim = 2:3))

# if the array already has axis names, those are used when possible
nx <- set_dimnames(x, paste0("axis", 1:3))
dimnames(nx)
dimnames(set_dimnames(nx, list(axis2 = c("x", "y", "z"))))
dimnames(set_dimnames(nx, c("x", "y", "z"), which_dim = "axis2"))


# pass NULL to drop all dimnames, or just names along a single dimension
nx2 <- set_dimnames(nx, c("x", "y", "z"), which_dim = "axis2")
nx2 <- set_dimnames(nx2, LETTERS[1:4], which_dim = "axis3")
dimnames(nx2)
dimnames(set_dimnames(nx2, NULL))
dimnames(set_dimnames(nx2, NULL, 2))
dimnames(set_dimnames(nx2, NULL, c(2, 3)))
# to preserve an axis name and only drop the dimnames, wrap the NULL in a list()
dimnames(set_dimnames(nx2, list(NULL)))
dimnames(set_dimnames(nx2, list(NULL), 2))
dimnames(set_dimnames(nx2, list(axis2 = NULL)))
dimnames(set_dimnames(nx2, list(axis2 = NULL, axis3 = NULL)))
dimnames(set_dimnames(nx2, list(NULL), 2:3))



