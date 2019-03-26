library(superml)


### Name: RandomSearchCV
### Title: Random Search CV
### Aliases: RandomSearchCV
### Keywords: datasets

### ** Examples

rf <- RFTrainer$new()
rst <-RandomSearchCV$new(trainer = rf,
                            parameters = list(n_estimators = c(100,500),
                            max_depth = c(5,2,10,14)),
                            n_folds = 3,
                            scoring = c('accuracy','auc'),
                            n_iter = 4)
data("iris")
rst$fit(iris, "Species")
rst$best_iteration()



