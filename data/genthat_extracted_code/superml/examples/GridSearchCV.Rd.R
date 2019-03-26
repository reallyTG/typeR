library(superml)


### Name: GridSearchCV
### Title: Grid Search CV
### Aliases: GridSearchCV
### Keywords: datasets

### ** Examples

rf <- RFTrainer$new()
gst <-GridSearchCV$new(trainer = rf,
                            parameters = list(n_estimators = c(100),
                                              max_depth = c(5,2,10)),
                                              n_folds = 3,
                                              scoring = c('accuracy','auc'))
data("iris")
gst$fit(iris, "Species")
gst$best_iteration()



