library(qdap)


### Name: outlier_labeler
### Title: Locate Outliers in Numeric String
### Aliases: outlier_labeler
### Keywords: scale, standardize

### ** Examples

## Not run: 
##D outlier_labeler(mtcars$hp)[20:32]
##D by(mtcars$mpg, mtcars$cyl, outlier_labeler)
##D tapply(mtcars$mpg, mtcars$cyl, outlier_labeler)
## End(Not run)



