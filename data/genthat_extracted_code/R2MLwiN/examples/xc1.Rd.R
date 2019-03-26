library(R2MLwiN)


### Name: xc1
### Title: Examination scores of 16-year olds in Fife, Scotland.
### Aliases: xc1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(xc1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(attain ~ 1 + (1 | sid) + (1 | pid) + (1 | pupil),
##D  estoptions = list(xc = TRUE, EstM = 1), data = xc1))
##D 
## End(Not run)



