library(UBL)


### Name: UtilOptimRegress
### Title: Optimization of predictions utility, cost or benefit for
###   regression problems.
### Aliases: UtilOptimRegress
### Keywords: utility optimization

### ** Examples

## Not run: 
##D #Example using a utility surface:
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
##D eval.util <- EvalRegressMetrics(test$medv, pred.res$optim, pred.res$utilRes,
##D                                  thr=0.8, control.parms = control.parms)
##D 
##D # train a normal model
##D model <- randomForest(medv~.,train)
##D normal.preds <- predict(model, test)
##D 
##D #obtain the utility of the new points (trues, preds)
##D NormalUtil <- UtilInterpol(test$medv, normal.preds, type="util", 
##D                            control.parms = control.parms,
##D                            minds, maxds, m.pts, method = "bilinear")
##D #check the performance
##D eval.normal <- EvalRegressMetrics(test$medv, normal.preds, NormalUtil,
##D                                   thr=0.8, control.parms = control.parms)
##D 
##D #check both results
##D eval.util
##D eval.normal
##D 
##D 
##D #check visually both predictions and the surface used
##D UtilInterpol(test$medv, normal.preds, type = "util", control.parms = control.parms,
##D                            minds, maxds, m.pts, method = "bilinear", visual=TRUE)
##D 
##D points(test$medv, normal.preds, col="green")
##D points(test$medv, pred.res$optim, col="blue")
##D 
##D # another example now using points interpolation with splines
##D data(algae,package="DMwR")
##D ds <- algae[complete.cases(algae[,1:12]),1:12]
##D tgt <- which(colnames(ds) == "a1")
##D sp <- sample(1:nrow(ds), as.integer(0.7*nrow(ds)))
##D train <- ds[sp,]
##D test <- ds[-sp,]
##D 
##D control.parms <- phi.control(ds[,tgt], method="extremes", extr.type="both")
##D 
##D # the boundaries of the domain considered
##D minds <- min(train[,tgt])
##D maxds <- max(train[,tgt])
##D 
##D # build m.pts to include at least (minds, maxds) and (maxds, minds) points
##D m.pts <- matrix(c(minds, maxds, -1, maxds, minds, -1),
##D                 byrow=TRUE, ncol=3)
##D 
##D pred.res <- UtilOptimRegress(a1~., train, test, type = "util", strat = "interpol",
##D                              strat.parms=list(method = "splines"),
##D                              control.parms = control.parms,
##D                              m.pts = m.pts, minds = minds, maxds = maxds)
##D 
##D # check the predictions
##D plot(test$a1, pred.res$optim)
##D # assess the performance
##D eval.util <- EvalRegressMetrics(test$a1, pred.res$optim, pred.res$utilRes,
##D                                 thr=0.8, control.parms = control.parms)
##D #
##D # train a normal model
##D model <- randomForest(a1~.,train)
##D normal.preds <- predict(model, test)
##D 
##D #obtain the utility of the new points (trues, preds)
##D NormalUtil <- UtilInterpol(test$medv, normal.preds, type = "util", 
##D                            control.parms = control.parms,
##D                            minds, maxds, m.pts, method="splines")
##D #check the performance
##D eval.normal <- EvalRegressMetrics(test$medv, normal.preds, NormalUtil,
##D                                   thr=0.8, control.parms = control.parms)
##D 
##D eval.util
##D eval.normal
##D 
##D # observe the utility surface with the normal preds
##D UtilInterpol(test$a1, normal.preds, type="util", control.parms = control.parms,
##D              minds, maxds, m.pts, method="splines", visual=TRUE) 
##D # add the optim preds
##D points(test$a1, pred.res$optim, col="green")
##D 
##D # Example using a cost surface:
##D data(Boston, package = "MASS")
##D 
##D tgt <- which(colnames(Boston) == "medv")
##D sp <- sample(1:nrow(Boston), as.integer(0.7*nrow(Boston)))
##D train <- Boston[sp,]
##D test <- Boston[-sp,]
##D 
##D # if using interpolation methods for COST surface, the control.parms can be set to NULL
##D # the boundaries of the domain considered
##D minds <- min(train[,tgt])
##D maxds <- max(train[,tgt])
##D 
##D # build m.pts to include at least (minds, maxds) and (maxds, minds) points
##D m.pts <- matrix(c(minds, maxds, 5, maxds, minds, 20),
##D                 byrow=TRUE, ncol=3)
##D 
##D pred.res <- UtilOptimRegress(medv~., train, test, type = "cost", strat = "interpol",
##D                              strat.parms = list(method = "bilinear"),
##D                              control.parms = NULL,
##D                              m.pts = m.pts, minds = minds, maxds = maxds)
##D 
##D # check the predictions
##D plot(test$medv, pred.res$optim)
##D 
##D # assess the performance
##D eval.util <- EvalRegressMetrics(test$medv, pred.res$optim, pred.res$utilRes,
##D                                 type="cost", maxC = 20)
##D #
##D # train a normal model
##D model <- randomForest(medv~.,train)
##D normal.preds <- predict(model, test)
##D 
##D #obtain the utility of the new points (trues, preds)
##D NormalUtil <- UtilInterpol(test$medv, normal.preds, type="cost", control.parms = NULL,
##D                            minds, maxds, m.pts, method="bilinear")
##D #check the performance
##D eval.normal <- EvalRegressMetrics(test$medv, normal.preds, NormalUtil,
##D                                   type="cost", maxC = 20)
##D 
##D eval.normal
##D eval.util
##D 
##D # check visually the surface and the predictions
##D UtilInterpol(test$medv, normal.preds, type="cost", control.parms = NULL,
##D                            minds, maxds, m.pts, method="bilinear",
##D                            visual=TRUE)
##D 
##D points(test$medv, pred.res$optim, col="blue")
##D 
## End(Not run)



