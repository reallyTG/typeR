library(standardize)


### Name: predict.standardized
### Title: Place new data into an already existing standardized space.
### Aliases: predict.standardized

### ** Examples

## Not run: 
##D train <- subset(mydata, train)
##D test <- subset(mydata, !train)
##D train.s <- standardize(y ~ x1 + f1 + (1 | g1), train)
##D mod <- lmer(train.s$formula, train.s$data)
##D test.s <- predict(train.s, test, response = TRUE)
##D preds <- predict(mod, newdata = test.s)  # can ignore warning about dropped contrasts
##D res <- test.s$y - preds
## End(Not run)




