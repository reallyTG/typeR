library(UBL)


### Name: EvalRegressMetrics
### Title: Utility metrics for assessing the performance of utility-based
###   regression tasks.
### Aliases: EvalRegressMetrics
### Keywords: evaluation metrics

### ** Examples

## Not run: 
##D #Example using a utility surface interpolated and observing the performance of 
##D # two models: i) a model obtained with a strategy designed for maximizing 
##D # predictions utility and a model obtained through a standard random Forest.
##D 
##D data(Boston, package = "MASS")
##D 
##D tgt <- which(colnames(Boston) == "medv")
##D sp <- sample(1:nrow(Boston), as.integer(0.7*nrow(Boston)))
##D train <- Boston[sp,]
##D test <- Boston[-sp,]
##D 
##D control.parms <- phi.control(Boston[,tgt], method="extremes", extr.type="both")
##D # the boundaries of the domain considered
##D minds <- min(train[,tgt])
##D maxds <- max(train[,tgt])
##D 
##D # build m.pts to include at least (minds, maxds) and (maxds, minds) points
##D # m.pts must only contain points in [minds, maxds] range.
##D m.pts <- matrix(c(minds, maxds, -1, maxds, minds, -1),
##D                 byrow=TRUE, ncol=3)
##D 
##D pred.res <- UtilOptimRegress(medv~., train, test, type = "util", strat = "interpol",
##D                              strat.parms=list(method = "bilinear"),
##D                              control.parms = control.parms,
##D                              m.pts = m.pts, minds = minds, maxds = maxds)
##D 
##D # assess the performance
##D eval.util <- EvalRegressMetrics(test$medv, pred.res$optim, pred.res$utilRes,
##D                                 thr = 0.8, control.parms = control.parms)
##D 
##D # now train a normal model
##D model <- randomForest(medv~.,train)
##D normal.preds <- predict(model, test)
##D 
##D #obtain the utility of this model predictions
##D NormalUtil <- UtilInterpol(test$medv, normal.preds, type = "util",
##D                            control.parms = control.parms,
##D                            minds, maxds, m.pts, method = "bilinear")
##D 
##D #check the performance
##D eval.normal <- EvalRegressMetrics(test$medv, normal.preds, NormalUtil,
##D                                   thr=0.8, control.parms = control.parms)
##D 
##D # 3 check visually the utility surface and the predictions of both models 
##D UtilInterpol(NULL,NULL, type = "util", control.parms = control.parms,
##D                            minds, maxds, m.pts, method = "bilinear", 
##D                            visual=TRUE, full.output = TRUE)
##D points(test$medv, normal.preds) # standard model predition points
##D points(test$medv, pred.res$optim, col="blue") # model with optimized predictions
## End(Not run)



