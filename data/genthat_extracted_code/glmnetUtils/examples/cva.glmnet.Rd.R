library(glmnetUtils)


### Name: cva.glmnet
### Title: Do elastic net cross-validation for alpha and lambda
###   simultaneously
### Aliases: cva.glmnet cva.glmnet.default cva.glmnet.formula
###   predict.cva.glmnet predict.cva.glmnet.formula coef.cva.glmnet
###   print.cva.glmnet.formula plot.cva.glmnet minlossplot
###   minlossplot.cva.glmnet

### ** Examples

cva <- cva.glmnet(mpg ~ ., data=mtcars)
predict(cva, mtcars, alpha=1)

## Not run: 
##D 
##D # Leukemia example dataset from Trevor Hastie's website
##D download.file("http://web.stanford.edu/~hastie/glmnet/glmnetData/Leukemia.RData",
##D               "Leukemia.RData")
##D load("Leukemia.Rdata")
##D leuk <- do.call(data.frame, Leukemia)
##D leuk.cva <- cva.glmnet(y ~ ., leuk, family="binomial")
##D leuk.pred <- predict(leuk.cva, leuk, which=6)
## End(Not run)



