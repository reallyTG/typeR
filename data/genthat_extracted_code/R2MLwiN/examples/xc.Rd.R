library(R2MLwiN)


### Name: xc
### Title: Examination scores of 16-year olds in Fife, Scotland.
### Aliases: xc
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(xc, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(attain ~ 1 + (1 | sid) + (1 | pid) + (1 | pupil),
##D  estoptions = list(xc = TRUE, EstM = 1), data = xc))
##D 
## End(Not run)



