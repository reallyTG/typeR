library(metaforest)


### Name: ModelInfo_mf
### Title: Returns a MetaForest ModelInfo list for use with caret
### Aliases: ModelInfo_mf

### ** Examples

## Not run: 
##D # Prepare data
##D data <- dat.bangertdrowns2004
##D data[, c(4:12)] <- apply(data[ , c(4:12)], 2, function(x){
##D   x[is.na(x)] <- median(x, na.rm = TRUE)
##D   x})
##D data$subject <- factor(data$subject)
##D data$yi <- as.numeric(data$yi)
##D # Load caret
##D library(caret)
##D set.seed(999)
##D # Specify the resampling method as 10-fold CV
##D fit_control <- trainControl(method = "cv", number = 10)
##D cv_mf_fit <- train(y = data$yi, x = data[,c(3:13, 16)],
##D                    method = ModelInfo_mf(), trControl = fit_control)
##D 
##D 
##D # Cross-validated clustered MetaForest
##D data <- get(data(dat.bourassa1996))
##D data <- escalc(measure = "OR", ai = lh.le, bi = lh.re, ci = rh.le, di= rh.re,
##D                data = data, add = 1/2, to = "all")
##D data$mage[is.na(data$mage)] <- median(data$mage, na.rm = TRUE)
##D data[c(5:8)] <- lapply(data[c(5:8)], factor)
##D data$yi <- as.numeric(data$yi)
##D # Set up 10-fold grouped CV
##D fit_control <- trainControl(method = "cv", index = groupKFold(data$sample,
##D                             k = 10))
##D # Set up a custom tuning grid for the three tuning parameters of MetaForest
##D rf_grid <- expand.grid(whichweights = c("random", "fixed", "unif"),
##D                        mtry = c(2, 4, 6),
##D                        min.node.size = c(2, 4, 6))
##D # Train the model
##D cv.mf.cluster <- train(y = data$yi, x = data[, c("selection", "investigator",
##D                                                  "hand_assess", "eye_assess",
##D                                                  "mage", "sex", "vi",
##D                                                  "sample")],
##D                        study = "sample", method = ModelInfo_mf(),
##D                        trControl = fit_control,
##D                        tuneGrid = rf_grid)
## End(Not run)



