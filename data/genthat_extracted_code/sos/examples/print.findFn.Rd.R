library(sos)


### Name: print.findFn
### Title: print a findFn object
### Aliases: print.findFn
### Keywords: print methods

### ** Examples

splineSearch <- findFn("spline", maxPages = 2)
if(!fda::CRAN()){
  print(splineSearch, 'console')
  splineSearch # all columns in a browser
}



