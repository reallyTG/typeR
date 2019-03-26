library(wsrf)


### Name: wsrf
### Title: Build a Forest of Weighted Subspace Decision Trees
### Aliases: wsrf wsrf.formula wsrf.default
### Keywords: models classif

### ** Examples

  library("wsrf")

  # Prepare parameters.
  ds <- rattle.data::weather
  dim(ds)
  names(ds)
  target <- "RainTomorrow"
  id     <- c("Date", "Location")
  risk   <- "RISK_MM"
  ignore <- c(id, if (exists("risk")) risk) 
  vars   <- setdiff(names(ds), ignore)
  if (sum(is.na(ds[vars]))) ds[vars] <- randomForest::na.roughfix(ds[vars])
  ds[target] <- as.factor(ds[[target]])
  (tt  <- table(ds[target]))
  form <- as.formula(paste(target, "~ ."))
  set.seed(42)
  train <- sample(nrow(ds), 0.7*nrow(ds))
  test  <- setdiff(seq_len(nrow(ds)), train)

  # Build model.  We disable parallelism here, since CRAN Repository
  # Policy (https://cran.r-project.org/web/packages/policies.html)
  # limits the usage of multiple cores to save the limited resource of
  # the check farm.

  model.wsrf <- wsrf(form, data=ds[train, vars], parallel=FALSE)
  
  # View model.
  print(model.wsrf)
  print(model.wsrf, tree=1)

  # Evaluate.
  strength(model.wsrf)
  correlation(model.wsrf)
  res <- predict(model.wsrf, newdata=ds[test, vars], type=c("response", "waprob"))
  actual <- ds[test, target]
  (accuracy.wsrf <- mean(res$response==actual))
  
  # Different type of prediction.
  cl <- apply(res$waprob, 1, which.max)
  cl <- factor(cl, levels=1:ncol(res$waprob), labels=levels(actual))
  (accuracy2.wsrf <- mean(cl==actual))



