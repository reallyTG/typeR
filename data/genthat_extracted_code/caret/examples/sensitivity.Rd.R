library(caret)


### Name: negPredValue
### Title: Calculate sensitivity, specificity and predictive values
### Aliases: negPredValue negPredValue.default negPredValue.table
###   negPredValue.matrix posPredValue posPredValue.default
###   posPredValue.table posPredValue.matrix sensitivity
###   sensitivity.default sensitivity.table sensitivity.matrix specificity
###   specificity.default specificity.table specificity.matrix
### Keywords: manip

### ** Examples


## Not run: 
##D ###################
##D ## 2 class example
##D 
##D lvs <- c("normal", "abnormal")
##D truth <- factor(rep(lvs, times = c(86, 258)),
##D                 levels = rev(lvs))
##D pred <- factor(
##D                c(
##D                  rep(lvs, times = c(54, 32)),
##D                  rep(lvs, times = c(27, 231))),               
##D                levels = rev(lvs))
##D 
##D xtab <- table(pred, truth)
##D 
##D sensitivity(pred, truth)
##D sensitivity(xtab)
##D posPredValue(pred, truth)
##D posPredValue(pred, truth, prevalence = 0.25)
##D 
##D specificity(pred, truth)
##D negPredValue(pred, truth)
##D negPredValue(xtab)
##D negPredValue(pred, truth, prevalence = 0.25)
##D 
##D 
##D prev <- seq(0.001, .99, length = 20)
##D npvVals <- ppvVals <- prev  * NA
##D for(i in seq(along = prev))
##D   {
##D     ppvVals[i] <- posPredValue(pred, truth, prevalence = prev[i])
##D     npvVals[i] <- negPredValue(pred, truth, prevalence = prev[i])
##D   }
##D 
##D plot(prev, ppvVals,
##D      ylim = c(0, 1),
##D      type = "l",
##D      ylab = "",
##D      xlab = "Prevalence (i.e. prior)")
##D points(prev, npvVals, type = "l", col = "red")
##D abline(h=sensitivity(pred, truth), lty = 2)
##D abline(h=specificity(pred, truth), lty = 2, col = "red")
##D legend(.5, .5,
##D        c("ppv", "npv", "sens", "spec"),
##D        col = c("black", "red", "black", "red"),
##D        lty = c(1, 1, 2, 2))
##D 
##D ###################
##D ## 3 class example
##D 
##D library(MASS)
##D 
##D fit <- lda(Species ~ ., data = iris)
##D model <- predict(fit)$class
##D 
##D irisTabs <- table(model, iris$Species)
##D 
##D ## When passing factors, an error occurs with more
##D ## than two levels
##D sensitivity(model, iris$Species)
##D 
##D ## When passing a table, more than two levels can
##D ## be used
##D sensitivity(irisTabs, "versicolor")
##D specificity(irisTabs, c("setosa", "virginica"))
## End(Not run)




