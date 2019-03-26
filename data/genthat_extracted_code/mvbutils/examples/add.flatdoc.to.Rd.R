library(mvbutils)


### Name: add.flatdoc.to
### Title: Skeletal flat-format documentation
### Aliases: add.flatdoc.to
### Keywords: internal

### ** Examples

myfun <- function( ...) ...
myfun <- add.flatdoc.to( myfun)
# 'fixr( myfun)' will now allow editing of code & doco together
# Or, in a maintained package:
# ..mypack$myfun <<- add.flatdoc.to( myfun, pkg='mypack')



