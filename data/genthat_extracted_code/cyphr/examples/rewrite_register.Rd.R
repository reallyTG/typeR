library(cyphr)


### Name: rewrite_register
### Title: Register functions to work with encrypt/decrypt
### Aliases: rewrite_register

### ** Examples

# The saveRDS function is already supported.  But if we wanted to
# support it we could look at the arguments for the function:
args(saveRDS)
# The 'file' argument is the one that refers to the filename, so
# we'd write:
cyphr::rewrite_register("base", "saveRDS", "file")
# It's non-API but you can see what is supported in the package by
# looking at
ls(cyphr:::db)



