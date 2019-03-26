library(glmnetUtils)


### Name: cv.glmnet
### Title: Formula interface for elastic net cross-validation with
###   cv.glmnet
### Aliases: cv.glmnet cv.glmnet.default cv.glmnet.formula
###   predict.cv.glmnet.formula coef.cv.glmnet.formula
###   print.cv.glmnet.formula

### ** Examples

cv.glmnet(mpg ~ ., data=mtcars)

cv.glmnet(Species ~ ., data=iris, family="multinomial")

## Not run: 
##D 
##D # Leukemia example dataset from Trevor Hastie's website
##D download.file("http://web.stanford.edu/~hastie/glmnet/glmnetData/Leukemia.RData",
##D               "Leukemia.RData")
##D load("Leukemia.Rdata")
##D leuk <- do.call(data.frame, Leukemia)
##D cv.glmnet(y ~ ., leuk, family="binomial")
## End(Not run)



