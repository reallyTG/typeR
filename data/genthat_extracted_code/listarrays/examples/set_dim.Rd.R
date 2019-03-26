library(listarrays)


### Name: set_dim
### Title: Reshape an array
### Aliases: set_dim

### ** Examples

set_dim(1:10, c(2, 5))
try( set_dim(1:7, c(2, 5)) ) # error by default, just like `dim<-`()
     set_dim(1:7, c(2, 5), pad = 99)
     set_dim(1:7, c(2, 5), pad = 99, order = "C") # fills row-wise

y <- x <- 1:4
# base::dim<- fills the array column wise
dim(x) <- c(2, 2)
x

# dim2 will fill the array row-wise
dim2(y) <- c(2, 2)
y

identical(x, set_dim(1:4, c(2,2)))
identical(y, set_dim(1:4, c(2,2), order = "C"))

## Not run: 
##D py_reshaped <- reticulate::array_reshape(1:4, c(2,2))
##D storage.mode(py_reshaped) <- "integer" # reticulate coerces to double
##D identical(y, py_reshaped)
##D # if needed, see listarrays:::array_reshape() for
##D # a drop-in pure R replacement for reticulate::array_reshape()
## End(Not run)



