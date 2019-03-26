library(mboost)


### Name: cvrisk
### Title: Cross-Validation
### Aliases: cvrisk cvrisk.mboost print.cvrisk plot.cvrisk cv
### Keywords: models regression

### ** Examples


  data("bodyfat", package = "TH.data")

  ### fit linear model to data
  model <- glmboost(DEXfat ~ ., data = bodyfat, center = TRUE)

  ### AIC-based selection of number of boosting iterations
  maic <- AIC(model)
  maic

  ### inspect coefficient path and AIC-based stopping criterion
  par(mai = par("mai") * c(1, 1, 1, 1.8))
  plot(model)
  abline(v = mstop(maic), col = "lightgray")

  ### 10-fold cross-validation
  cv10f <- cv(model.weights(model), type = "kfold")
  cvm <- cvrisk(model, folds = cv10f, papply = lapply)
  print(cvm)
  mstop(cvm)
  plot(cvm)

  ### 25 bootstrap iterations (manually)
  set.seed(290875)
  n <- nrow(bodyfat)
  bs25 <- rmultinom(25, n, rep(1, n)/n)
  cvm <- cvrisk(model, folds = bs25, papply = lapply)
  print(cvm)
  mstop(cvm)
  plot(cvm)

  ### same by default
  set.seed(290875)
  cvrisk(model, papply = lapply)

  ### 25 bootstrap iterations (using cv)
  set.seed(290875)
  bs25_2 <- cv(model.weights(model), type="bootstrap")
  all(bs25 == bs25_2)

## No test: 
############################################################
## Do not run this example automatically as it takes
## some time (~ 5 seconds depending on the system)

  ### trees
  blackbox <- blackboost(DEXfat ~ ., data = bodyfat)
  cvtree <- cvrisk(blackbox, papply = lapply)
  plot(cvtree)
  
## End(Not run this automatically)  
## End(No test)


### cvrisk in parallel modes:

## Not run: 
##D ## at least not automatically
##D 
##D ## parallel::mclapply() which is used here for parallelization only runs 
##D ## on unix systems (here we use 2 cores)
##D 
##D     cvrisk(model, mc.cores = 2)
##D 
##D ## infrastructure needs to be set up in advance
##D 
##D     cl <- makeCluster(25) # e.g. to run cvrisk on 25 nodes via PVM
##D     myApply <- function(X, FUN, ...) {
##D       myFun <- function(...) {
##D           library("mboost") # load mboost on nodes
##D           FUN(...)
##D       }
##D       ## further set up steps as required
##D       parLapply(cl = cl, X, myFun, ...)
##D     }
##D     cvrisk(model, papply = myApply)
##D     stopCluster(cl)
## End(Not run)




