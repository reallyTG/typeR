library(sperrorest)


### Name: sperrorest
### Title: Perform spatial error estimation and variable importance
###   assessment in parallel
### Aliases: sperrorest

### ** Examples

## Not run: 
##D 
##D ##------------------------------------------------------------
##D ## Classification tree example using non-spatial partitioning
##D ## setup and default parallel mode ("foreach")
##D ##------------------------------------------------------------
##D 
##D data(ecuador) # Muenchow et al. (2012), see ?ecuador
##D fo <- slides ~ dem + slope + hcurv + vcurv + log.carea + cslope
##D 
##D library(rpart)
##D mypred_part <- function(object, newdata) predict(object, newdata)[, 2]
##D ctrl <- rpart.control(cp = 0.005) # show the effects of overfitting
##D fit <- rpart(fo, data = ecuador, control = ctrl)
##D 
##D ### Non-spatial 5-repeated 10-fold cross-validation:
##D mypred_part <- function(object, newdata) predict(object, newdata)[, 2]
##D par_nsp_res <- sperrorest(data = ecuador, formula = fo,
##D                           model_fun = rpart,
##D                           model_args = list(control = ctrl),
##D                           pred_fun = mypred_part,
##D                           progress = TRUE,
##D                           smp_fun = partition_cv,
##D                           smp_args = list(repetition = 1:5, nfold = 10))
##D summary(par_nsp_res$error_rep)
##D summary(par_nsp_res$error_fold)
##D summary(par_nsp_res$represampling)
##D # plot(par_nsp_res$represampling, ecuador)
##D 
##D ### Spatial 5-repeated 10-fold spatial cross-validation:
##D par_sp_res <- sperrorest(data = ecuador, formula = fo,
##D                          model_fun = rpart,
##D                          model_args = list(control = ctrl),
##D                          pred_fun = mypred_part,
##D                          progress = TRUE,
##D                          smp_fun = partition_kmeans,
##D                          smp_args = list(repetition = 1:5, nfold = 10))
##D summary(par_sp_res$error_rep)
##D summary(par_sp_res$error_fold)
##D summary(par_sp_res$represampling)
##D # plot(par_sp_res$represampling, ecuador)
##D 
##D smry <- data.frame(
##D     nonspat_training = unlist(summary(par_nsp_res$error_rep,
##D                                       level = 1)$train_auroc),
##D     nonspat_test     = unlist(summary(par_nsp_res$error_rep,
##D                                       level = 1)$test_auroc),
##D     spatial_training = unlist(summary(par_sp_res$error_rep,
##D                                       level = 1)$train_auroc),
##D     spatial_test     = unlist(summary(par_sp_res$error_rep,
##D                                      level = 1)$test_auroc))
##D boxplot(smry, col = c('red','red','red','green'),
##D     main = 'Training vs. test, nonspatial vs. spatial',
##D     ylab = 'Area under the ROC curve')
##D 
##D ##------------------------------------------------------------
##D ## Logistic regression example (glm) using partition_kmeans
##D ## and computation of permutation based variable importance
##D ##------------------------------------------------------------
##D 
##D data(ecuador)
##D fo <- slides ~ dem + slope + hcurv + vcurv + log.carea + cslope
##D 
##D out <- sperrorest(data = ecuador, formula = fo,
##D                   model_fun = glm,
##D                   model_args = list(family = "binomial"),
##D                   pred_fun = predict,
##D                   pred_args = list(type = "response"),
##D                   smp_fun = partition_kmeans,
##D                   smp_args = list(repetition = 1:2, nfold = 4),
##D                   par_args = list(par_mode = "future"),
##D                   importance = TRUE, imp_permutations = 10)
##D summary(out$error_rep)
##D summary(out$importance)
## End(Not run)



