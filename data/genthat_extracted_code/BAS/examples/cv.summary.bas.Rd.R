library(BAS)


### Name: cv.summary.bas
### Title: Summaries for Out of Sample Prediction
### Aliases: cv.summary.bas
### Keywords: regression

### ** Examples


## Not run: 
##D library(foreign)
##D cognitive <- read.dta("http://www.stat.columbia.edu/~gelman/arm/examples/child.iq/kidiq.dta")
##D cognitive$mom_work <- as.numeric(cognitive$mom_work > 1)
##D cognitive$mom_hs <- as.numeric(cognitive$mom_hs > 0)
##D colnames(cognitive) <- c("kid_score", "hs", "iq", "work", "age")
##D 
##D set.seed(42)
##D n <- nrow(cognitive)
##D test <- sample(1:n, size = round(.20 * n), replace = FALSE)
##D testdata <- cognitive[test, ]
##D traindata <- cognitive[-test, ]
##D cog_train <- bas.lm(kid_score ~ ., prior = "BIC", modelprior = uniform(), data = traindata)
##D yhat <- predict(cog_train, newdata = testdata, estimator = "BMA", se = F)
##D cv.summary.bas(yhat$fit, testdata$kid_score)
## End(Not run)



