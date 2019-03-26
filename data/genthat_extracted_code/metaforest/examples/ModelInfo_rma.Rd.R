library(metaforest)


### Name: ModelInfo_rma
### Title: Returns an rma ModelInfo list for use with caret
### Aliases: ModelInfo_rma

### ** Examples

## Not run: 
##D # Prepare data
##D dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
##D dat$yi <- as.numeric(dat$yi)
##D dat$alloc <- factor(dat$alloc)
##D # Run rma
##D rma.model <- rma(y = dat$yi, mods = dat[, c("ablat", "year")], vi = dat$vi)
##D # R^2 is estimated to be .64
##D rma.model$R2
##D # Now, use cross-validation to see how well this model generalizes
##D # Leave-one-out cross-validation is more appropriate than 10-fold cv because
##D # the sample size is very small
##D fit_control <- trainControl(method = "LOOCV")
##D # Train the model without tuning, because rma has no tuning parameters
##D cv.mf.cluster <- train(y = dat$yi, x = dat[, c("ablat", "year")],
##D                        weights = dat$vi,
##D                        method = ModelInfo_rma(),
##D                        trControl = fit_control)
##D # Cross-validated R^2 is .08, suggesting substantial overfitting of the
##D # original rma model
##D cv.mf.cluster$results$Rsquared
## End(Not run)



