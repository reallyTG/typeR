library(caret)


### Name: thresholder
### Title: Generate Data to Choose a Probability Threshold
### Aliases: thresholder

### ** Examples

## Not run: 
##D set.seed(2444)
##D dat <- twoClassSim(500, intercept = -10)
##D table(dat$Class)
##D 
##D ctrl <- trainControl(method = "cv", 
##D                      classProbs = TRUE,
##D                      savePredictions = "all",
##D                      summaryFunction = twoClassSummary)
##D 
##D set.seed(2863)
##D mod <- train(Class ~ ., data = dat, 
##D              method = "rda",
##D              tuneLength = 4,
##D              metric = "ROC",
##D              trControl = ctrl)
##D 
##D resample_stats <- thresholder(mod, 
##D                               threshold = seq(.5, 1, by = 0.05), 
##D                               final = TRUE)
##D 
##D ggplot(resample_stats, aes(x = prob_threshold, y = J)) + 
##D   geom_point()
##D ggplot(resample_stats, aes(x = prob_threshold, y = Dist)) + 
##D   geom_point()
##D ggplot(resample_stats, aes(x = prob_threshold, y = Sensitivity)) + 
##D   geom_point() + 
##D   geom_point(aes(y = Specificity), col = "red")
## End(Not run)



