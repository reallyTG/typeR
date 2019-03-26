library(pre)


### Name: caret_pre_model
### Title: Model set up for train function of package caret
### Aliases: caret_pre_model
### Keywords: datasets

### ** Examples

## Not run: 
##D  
##D library("caret")
##D 
##D ## Prepare data:
##D airq <- airquality[complete.cases(airquality),]
##D y <- airq$Ozone
##D x <- airq[,-1]
##D 
##D ## Apply caret with only pre's default settings (trControl and ntrees argument
##D ## are employed here only to reduce computation time):
##D set.seed(42)
##D prefit1 <- train(x = x, y = y, method = caret_pre_model,
##D                  trControl = trainControl(number = 1),
##D                  ntrees = 5L)
##D prefit1
##D 
##D ## Create custom tuneGrid:
##D set.seed(42)
##D tuneGrid <- caret_pre_model$grid(x = x, y = y,
##D                                  use.grad = c(TRUE, FALSE),
##D                                  maxdepth = 3L:5L,
##D                                  learnrate = c(.01, .1),
##D                                  penalty.par.val = c("lambda.1se", "lambda.min"))
##D tuneGrid
##D ## Apply caret (again, ntrees and trControl set only to reduce computation time):
##D prefit2 <- train(x = x, y = y, method = caret_pre_model,
##D                  trControl = trainControl(number = 1),
##D                  tuneGrid = tuneGrid)
##D prefit2
##D 
##D ## Get best tuning parameter values:
##D prefit2$bestTune
##D ## Get predictions from model with best tuning parameters:
##D predict(prefit2, newdata = x[1:10,])
##D ## Predictors included in model with best tuning parameter values:
##D predictors(prefit2)
##D varImp(prefit2)
##D plot(prefit2)
##D 
##D ## Obtain tuning grid through random search over the tuning parameter space:
##D set.seed(42)
##D tuneGrid2 <- caret_pre_model$grid(x = x, y = y, search = "random", len = 10)
##D tuneGrid2
##D set.seed(42)
##D prefit3 <- train(x = x, y = y, method = caret_pre_model,
##D                  trControl = trainControl(number = 1, verboseIter = TRUE),
##D                  tuneGrid = tuneGrid2, ntrees = 5L)
##D prefit3
##D 
##D ## Count response:
##D set.seed(42)
##D prefit4 <- train(x = x, y = y, method = caret_pre_model,
##D                  trControl = trainControl(number = 1),
##D                  ntrees = 5L, family = "poisson")
##D prefit4
##D 
##D ## Binary factor response:
##D y_bin <- factor(airq$Ozone > mean(airq$Ozone))
##D set.seed(42)
##D prefit5 <- train(x = x, y = y_bin, method = caret_pre_model,
##D                  trControl = trainControl(number = 1),
##D                  ntrees = 5L, family = "binomial")
##D prefit5
##D 
##D ## Factor response with > 2 levels:
##D x_multin <- airq[,-5]
##D y_multin <- factor(airq$Month)
##D set.seed(42)
##D prefit6 <- train(x = x_multin, y = y_multin, method = caret_pre_model,
##D                  trControl = trainControl(number = 1),
##D                  ntrees = 5L, family = "multinomial")
##D prefit6
## End(Not run)



