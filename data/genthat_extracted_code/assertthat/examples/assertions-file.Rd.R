library(assertthat)


### Name: assertions-file
### Title: Useful test related to files
### Aliases: assertions-file is.dir is.writeable is.readable has_extension

### ** Examples

see_if(is.dir(1))

tmp <- tempfile()
see_if(file.exists(tmp))
see_if(is.dir(tmp))

writeLines("x", tmp)
see_if(file.exists(tmp))
see_if(is.dir(tmp))
see_if(is.writeable(tmp))
see_if(is.readable(tmp))
unlink(tmp)

see_if(is.readable(tmp))



