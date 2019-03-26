library(idx2r)


### Name: read_idx
### Title: Read an IDX file
### Aliases: read_idx

### ** Examples

m = matrix(1:16, nrow = 4)
file_name = file.path(tempdir(),"m.idx")
write_idx(m, file_name)  
mr = read_idx(file_name) 



