library(listarrays)


### Name: array2
### Title: Make or reshape an array with C-style (row-major) semantics
### Aliases: array2 dim2<- set_dim2

### ** Examples

array(1:4, c(2,2))
array2(1:4, c(2,2))

# for a drop-in replacement to reticulate::array_reshape
array_reshape <- listarrays:::array_reshape
array_reshape(1:4, c(2,2))



