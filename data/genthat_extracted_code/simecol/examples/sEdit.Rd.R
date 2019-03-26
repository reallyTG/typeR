library(simecol)


### Name: sEdit
### Title: Simple editing
### Aliases: sEdit
### Keywords: utilities

### ** Examples

## Not run: 
##D require("tcltk")
##D ## named vector
##D vec  <- c(a = 1, b = 20, c = 0.03)
##D new  <- sEdit(vec)
##D ## unnamed vector
##D sEdit(numeric(10))
##D ## list of vectors
##D lst <- list(vec = vec, test = 1:10)
##D sEdit(lst)
##D ## list with numeric and character vectors mixed
##D lst <- list(vec = vec, test = c("a", "b", "c"))
##D sEdit(lst)
## End(Not run)



