library(wsrf)


### Name: subset.wsrf
### Title: Subset of a Forest
### Aliases: subset subset.wsrf

### ** Examples

  library("wsrf")

  # Prepare parameters.
  ds     <- rattle.data::weather
  target <- "RainTomorrow"
  vars   <- setdiff(names(ds), c("Date", "Location", "RISK_MM"))
  if (sum(is.na(ds[vars]))) ds[vars] <- randomForest::na.roughfix(ds[vars])
  ds[target] <- as.factor(ds[[target]])
  form <- as.formula(paste(target, "~ ."))
  set.seed(42)
  train <- sample(nrow(ds), 0.7*nrow(ds))
  test  <- setdiff(seq_len(nrow(ds)), train)
  
  # Build model.  We disable parallelism here, since CRAN Repository
  # Policy (https://cran.r-project.org/web/packages/policies.html)
  # limits the usage of multiple cores to save the limited resource of
  # the check farm.

  model.wsrf <- wsrf(form, data=ds[train, vars], parallel=FALSE)
  print(model.wsrf)
  
  # Subset.
  submodel.wsrf <- subset.wsrf(model.wsrf, 1:200)
  print(submodel.wsrf)
  cl <- predict(submodel.wsrf, newdata=ds[test, vars], type="response")$response
  actual <- ds[test, target]
  (accuracy.wsrf <- mean(cl==actual))



