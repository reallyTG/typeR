library(BTLLasso)


### Name: SimData
### Title: Simulated data set for illustration
### Aliases: SimData
### Keywords: datasets

### ** Examples


## Not run: 
##D op <- par(no.readonly = TRUE)
##D 
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
##D par(op)
## End(Not run)



