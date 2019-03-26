library(pkgbuild)


### Name: with_debug
### Title: Temporarily set debugging compilation flags.
### Aliases: with_debug

### ** Examples

flags <- names(compiler_flags(TRUE))
with_debug(Sys.getenv(flags))

## Not run: 
##D install("mypkg")
##D with_debug(install("mypkg"))
## End(Not run)



