## ----eval=FALSE----------------------------------------------------------
#  install.packages("wsrf")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("simonyansenzhao/wsrf")

## ----usage_load, message=FALSE-------------------------------------------
library("rattle.data")
ds <- weather
dim(ds)
names(ds)

## ----usage_prepare-------------------------------------------------------
target <- "RainTomorrow"
ignore <- c("Date", "Location", "RISK_MM")
(vars <- setdiff(names(ds), ignore))
dim(ds[vars])

## ----message=FALSE-------------------------------------------------------
library("randomForest")
if (sum(is.na(ds[vars]))) ds[vars] <- na.roughfix(ds[vars])
ds[target] <- as.factor(ds[[target]])
(tt <- table(ds[target]))

## ------------------------------------------------------------------------
(form <- as.formula(paste(target, "~ .")))

## ------------------------------------------------------------------------
seed <- 42
set.seed(seed)
length(train <- sample(nrow(ds), 0.7*nrow(ds)))
length(test <- setdiff(seq_len(nrow(ds)), train))

## ----eval=FALSE----------------------------------------------------------
#  wsrf(formula, data, ...)

## ----eval=FALSE----------------------------------------------------------
#  wsrf(x,
#       y,
#       mtry=floor(log2(length(x))+1),
#       ntree=500,
#       weights=TRUE,
#       parallel=TRUE,
#       na.action=na.fail,
#       importance=FALSE,
#       nodesize=2,
#       clusterlogfile,
#       ...)

## ----usage_build_by_default, message=FALSE-------------------------------
library("wsrf")
model.wsrf.1 <- wsrf(form, data=ds[train, vars], parallel=FALSE)
print(model.wsrf.1)
print(model.wsrf.1, 1)  # Print tree 1.

## ----usage_evaluate------------------------------------------------------
cl <- predict(model.wsrf.1, newdata=ds[test, vars], type="class")$class
actual <- ds[test, target]
(accuracy.wsrf <- mean(cl == actual, na.rm=TRUE))

## ----usage_build_another, message=FALSE----------------------------------
# Here we build another model without weighting.
model.wsrf.2 <- wsrf(form, data=ds[train, vars], weights=FALSE, parallel=FALSE)
print(model.wsrf.2)

## ----usage_subset_combine------------------------------------------------
submodel.wsrf <- subset.wsrf(model.wsrf.1, 1:150)
print(submodel.wsrf)
bigmodel.wsrf <- combine.wsrf(model.wsrf.1, model.wsrf.2)
print(bigmodel.wsrf)

## ----usage_build_on_cluster, eval=FALSE----------------------------------
#  servers <- paste0("node", 31:40)
#  model.wsrf.3 <- wsrf(form, data=ds[train, vars], parallel=servers)

