library(ranger)


### Name: ranger
### Title: Ranger
### Aliases: ranger

### ** Examples

require(ranger)

## Classification forest with default settings
ranger(Species ~ ., data = iris)

## Prediction
train.idx <- sample(nrow(iris), 2/3 * nrow(iris))
iris.train <- iris[train.idx, ]
iris.test <- iris[-train.idx, ]
rg.iris <- ranger(Species ~ ., data = iris.train)
pred.iris <- predict(rg.iris, data = iris.test)
table(iris.test$Species, pred.iris$predictions)

## Quantile regression forest
rf <- ranger(mpg ~ ., mtcars[1:26, ], quantreg = TRUE)
pred <- predict(rf, mtcars[27:32, ], type = "quantiles")
pred$predictions

## Variable importance
rg.iris <- ranger(Species ~ ., data = iris, importance = "impurity")
rg.iris$variable.importance

## Survival forest
require(survival)
rg.veteran <- ranger(Surv(time, status) ~ ., data = veteran)
plot(rg.veteran$unique.death.times, rg.veteran$survival[1,])

## Alternative interface
ranger(dependent.variable.name = "Species", data = iris)

## Not run: 
##D ## Use GenABEL interface to read Plink data into R and grow a classification forest
##D ## The ped and map files are not included
##D library(GenABEL)
##D convert.snp.ped("data.ped", "data.map", "data.raw")
##D dat.gwaa <- load.gwaa.data("data.pheno", "data.raw")
##D phdata(dat.gwaa)$trait <- factor(phdata(dat.gwaa)$trait)
##D ranger(trait ~ ., data = dat.gwaa)
## End(Not run)




