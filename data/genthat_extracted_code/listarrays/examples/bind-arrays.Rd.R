library(listarrays)


### Name: bind_as_dim
### Title: Bind arrays along a specified dimension
### Aliases: bind_as_dim bind_as_rows bind_as_cols bind_on_dim bind_on_rows
###   bind_on_cols

### ** Examples

list_of_arrays <- replicate(10, array(1:8, dim = c(2,3,4)), FALSE)

dim(list_of_arrays[[1]])

# bind on a new dimension
combined_as <- bind_as_rows(list_of_arrays)
dim(combined_as)
dim(combined_as)[1] == length(list_of_arrays)

# each element in `list_of_arrays` corresponds to one "row"
# (i.e., one entry in along the first dimension)
for(i in seq_along(list_of_arrays))
  stopifnot(identical(combined_as[i,,,], list_of_arrays[[i]]))

# bind on an existing dimension
combined_on <- bind_on_rows(list_of_arrays)
dim(combined_on)
dim(combined_on)[1] == sum(sapply(list_of_arrays, function(x) dim(x)[1]))
identical(list_of_arrays[[1]], combined_on[1:2,,])
for (i in seq_along(list_of_arrays))
  stopifnot(identical(
    list_of_arrays[[i]], combined_on[ (1:2) + (i-1)*2,,]
  ))

# bind on any dimension
combined <- bind_as_dim(list_of_arrays, 3)
dim(combined)
for(i in seq_along(list_of_arrays))
   stopifnot(identical(combined[,,i,], list_of_arrays[[i]]))



