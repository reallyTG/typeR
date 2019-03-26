library(idx2r)


### Name: write_idx
### Title: Write an array into an IDX file
### Aliases: write_idx

### ** Examples

m = matrix(1:16, nrow = 4)
file_name = file.path(tempdir(),"m.idx")
write_idx(m, file_name)    



