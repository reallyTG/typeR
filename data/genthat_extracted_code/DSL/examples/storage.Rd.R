library(DSL)


### Name: DStorage
### Title: Virtual Distributed Storage Class
### Aliases: DStorage is.DStorage

### ** Examples

## creating a new virtual storage using 50MB chunks
ds <- DStorage(type = "LFS", base_dir = tempdir(),
chunksize = 50 * 1024^2)
is.DStorage( ds )



