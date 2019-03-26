library(mvbutils)


### Name: dochelp
### Title: Documentation (informal help)
### Aliases: dochelp
### Keywords: documentation

### ** Examples

#
myfun <- structure( function() 1,
  doc="Here is some informal documentation for myfun\n")
dochelp( "myfun")
help( "myfun") # calls dochelp



