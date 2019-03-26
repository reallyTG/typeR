library(ff)


### Name: levels.ff
### Title: Getting and setting factor levels
### Aliases: levels.ff levels<-.ff is.factor is.factor.default is.factor.ff
###   is.ordered is.ordered.default is.ordered.ff
### Keywords: IO data attribute

### ** Examples

  message("--- create an ff factor including NA as last level")
  x <- ff("a", levels=c(letters, NA), length=99)
  message('    we expect a warning because "A" is an unknown level')
  x[] <- c("a", NA,"A")
  x
  levels(x)

  message("--- create an ff ordered factor")
  x <- ff(letters, levels=letters, ramclass=c("ordered","factor"), length=260)
  x
  levels(x)

  message("    make it a non-ordered factor")
  virtual(x)$ramclass <- "factor"
  x
  rm(x); gc()

 ## Not run: 
##D   message("--- create an unsigned quad factor")
##D   x <- ff(c("A","T","G","C"), levels=c("A","T","G","C"), vmode="quad", length=100)
##D   x
##D   message("  0:3 coding usually invisible to the user")
##D   unclass(x[1:4])
##D   message("    after removing levels, the 0:3 coding becomes visible to the user")
##D   message("    we expect a warning here")
##D   levels(x) <- NULL
##D   x[1:4]
##D   rm(x); gc()
##D  
## End(Not run)




