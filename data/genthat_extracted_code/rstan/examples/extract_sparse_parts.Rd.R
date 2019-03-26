library(rstan)


### Name: extract_sparse_parts
### Title: Extract the compressed representation of a sparse matrix
### Aliases: extract_sparse_parts

### ** Examples

  A <- rbind(
    c(19L, 27L,  0L,  0L),
    c( 0L,  0L,  0L,  0L),
    c( 0L,  0L,  0L, 52L),
    c(81L,  0L, 95L, 33L)
  )
  str(extract_sparse_parts(A))



