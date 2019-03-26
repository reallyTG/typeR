library(BTLLasso)


### Name: cv.BTLLasso
### Title: Cross-validation function for BTLLasso
### Aliases: cv.BTLLasso
### Keywords: BTLLasso cross validation

### ** Examples


## Not run: 
##D op <- par(no.readonly = TRUE)
##D 
##D ##############################
##D ##### Example with simulated data set containing X, Z1 and Z2
##D ##############################
##D data(SimData)
##D 
##D ## Specify control argument
##D ## -> allow for object-specific order effects and penalize intercepts
##D ctrl <- ctrl.BTLLasso(penalize.intercepts = TRUE, object.order.effect = TRUE,
##D                       penalize.order.effect.diffs = TRUE)
##D 
##D ## Simple BTLLasso model for tuning parameters lambda
##D m.sim <- BTLLasso(Y = SimData$Y, X = SimData$X, Z1 = SimData$Z1,
##D                   Z2 = SimData$Z2, control = ctrl)
##D m.sim
##D 
##D par(xpd = TRUE)
##D plot(m.sim)
##D 
##D 
##D ## Cross-validate BTLLasso model for tuning parameters lambda
##D set.seed(1860)
##D m.sim.cv <- cv.BTLLasso(Y = SimData$Y, X = SimData$X, Z1 = SimData$Z1,
##D                         Z2 = SimData$Z2, control = ctrl)
##D m.sim.cv
##D coef(m.sim.cv)
##D logLik(m.sim.cv)
##D 
##D head(predict(m.sim.cv, type="response"))
##D head(predict(m.sim.cv, type="trait"))
##D 
##D plot(m.sim.cv, plots_per_page = 4)
##D 
##D 
##D ## Example for bootstrap intervals for illustration only
##D ## Don't calculate bootstrap intervals with B = 20!!!!
##D set.seed(1860)
##D m.sim.boot <- boot.BTLLasso(m.sim.cv, B = 20, cores = 20)
##D m.sim.boot
##D plot(m.sim.boot, plots_per_page = 4)
##D 
##D 
##D ##############################
##D ##### Example with small version from GLES data set
##D ##############################
##D data(GLESsmall)
##D 
##D ## extract data and center covariates for better interpretability
##D Y <- GLESsmall$Y
##D X <- scale(GLESsmall$X, scale = FALSE)
##D Z1 <- scale(GLESsmall$Z1, scale = FALSE)
##D 
##D ## vector of subtitles, containing the coding of the X covariates
##D subs.X <- c('', 'female (1); male (0)')
##D 
##D ## Cross-validate BTLLasso model
##D m.gles.cv <- cv.BTLLasso(Y = Y, X = X, Z1 = Z1)
##D m.gles.cv
##D 
##D coef(m.gles.cv)
##D logLik(m.gles.cv)
##D 
##D head(predict(m.gles.cv, type="response"))
##D head(predict(m.gles.cv, type="trait"))
##D 
##D par(xpd = TRUE, mar = c(5,4,4,6))
##D plot(m.gles.cv, subs.X = subs.X, plots_per_page = 4, which = 2:5)
##D paths(m.gles.cv, y.axis = 'L2')
##D 
##D 
##D ##############################
##D ##### Example with Bundesliga data set
##D ##############################
##D data(Buli1516)
##D 
##D Y <- Buli1516$Y5
##D 
##D Z1 <- scale(Buli1516$Z1, scale = FALSE)
##D 
##D ctrl.buli <- ctrl.BTLLasso(object.order.effect = TRUE, 
##D                            name.order = "Home", 
##D                            penalize.order.effect.diffs = TRUE, 
##D                            penalize.order.effect.absolute = FALSE,
##D                            order.center = TRUE, lambda2 = 1e-2)
##D 
##D set.seed(1860)
##D m.buli <- cv.BTLLasso(Y = Y, Z1 = Z1, control = ctrl.buli)
##D m.buli
##D 
##D par(xpd = TRUE, mar = c(5,4,4,6))
##D plot(m.buli)
##D 
##D 
##D ##############################
##D ##### Example with Topmodel data set
##D ##############################
##D data("Topmodel2007", package = "psychotree")
##D 
##D Y.models <- response.BTLLasso(Topmodel2007$preference)
##D X.models <- scale(model.matrix(preference~., data = Topmodel2007)[,-1])
##D rownames(X.models) <- paste0("Subject",1:nrow(X.models))
##D colnames(X.models) <- c("Gender","Age","KnowShow","WatchShow","WatchFinal")
##D 
##D set.seed(5)
##D m.models <- cv.BTLLasso(Y = Y.models, X = X.models)
##D plot(m.models, plots_per_page = 6)
##D 
##D par(op)
## End(Not run)



