library(idx2r)


### Name: idx2r-package
### Title: Convert Files to and from IDX Format to Vectors, Matrices and
###   Arrays in R
### Aliases: idx2r idx2r-package

### ** Examples

m = matrix(1:16, nrow = 4)
file_name = file.path(tempdir(),"m.idx")
write_idx(m, file_name)
mr = read_idx(file_name)



