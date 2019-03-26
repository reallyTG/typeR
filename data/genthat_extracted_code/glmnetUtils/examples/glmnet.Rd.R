library(glmnetUtils)


### Name: glmnet
### Title: Formula interface for elastic net modelling with glmnet
### Aliases: glmnet glmnet.default glmnet.formula predict.glmnet.formula
###   coef.glmnet.formula print.glmnet.formula

### ** Examples

glmnet(mpg ~ ., data=mtcars)

glmnet(Species ~ ., data=iris, family="multinomial")

## Not run: 
##D 
##D # Leukemia example dataset from Trevor Hastie's website
##D download.file("http://web.stanford.edu/~hastie/glmnet/glmnetData/Leukemia.RData",
##D               "Leukemia.RData")
##D load("Leukemia.Rdata")
##D leuk <- do.call(data.frame, Leukemia)
##D glmnet(y ~ ., leuk, family="binomial")
## End(Not run)



