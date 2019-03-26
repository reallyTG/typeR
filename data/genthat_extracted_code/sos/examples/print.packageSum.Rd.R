library(sos)


### Name: print.packageSum
### Title: print a packageSum object
### Aliases: print.packageSum
### Keywords: print methods

### ** Examples

splineHelp <- findFn("spline", maxPages = 2)
splinePkgs <- packageSum(splineHelp)
if(!fda::CRAN()){
  print(splinePkgs, 'console')
  splinePkgs # all columns in a browser
}



