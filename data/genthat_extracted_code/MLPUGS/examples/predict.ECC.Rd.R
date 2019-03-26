library(MLPUGS)


### Name: predict.ECC
### Title: Classify new samples using an Ensemble of Classifier Chains
### Aliases: predict.ECC

### ** Examples

x <- movies_train[, -(1:3)]
y <- movies_train[, 1:3]

model_glm <- ecc(x, y, m = 1, .f = glm.fit, family = binomial(link = "logit"))

predictions_glm <- predict(model_glm, movies_test[, -(1:3)],
.f = function(glm_fit, newdata) {

  # Credit for writing the prediction function that works
  # with objects created through glm.fit goes to Thomas Lumley
  
  eta <- as.matrix(newdata) %*% glm_fit$coef
  output <- glm_fit$family$linkinv(eta)
  colnames(output) <- "1"
  return(output)
  
}, n.iters = 10, burn.in = 0, thin = 1)

## Not run: 
##D 
##D model_c50 <- ecc(x, y, .f = C50::C5.0)
##D predictions_c50 <- predict(model_c50, movies_test[, -(1:3)],
##D                            n.iters = 10, burn.in = 0, thin = 1,
##D                            .f = C50::predict.C5.0, type = "prob")
##D   
##D model_rf <- ecc(x, y, .f = randomForest::randomForest)
##D predictions_rf <- predict(model_rf, movies_test[, -(1:3)],
##D                           n.iters = 1000, burn.in = 100, thin = 10,
##D                           .f = function(rF, newdata) {
##D                             randomForest:::predict.randomForest(rF, newdata, type = "prob")
##D                           })
## End(Not run)



