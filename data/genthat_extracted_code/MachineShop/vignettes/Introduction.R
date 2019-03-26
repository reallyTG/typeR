## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE,
  fig.width = 7,
  fig.height = 4,
  fig.align = "center"
)

library(kableExtra)

set.seed(123)

## ------------------------------------------------------------------------
## Load libraries for the survival analysis
library(MachineShop)
library(survival)
library(MASS)
library(magrittr)

## Malignant melanoma cancer dataset
head(Melanoma)

## Create training and test sets
n <- nrow(Melanoma) * 2 / 3
train <- head(Melanoma, n)
test <- head(Melanoma, -n)

## Global formula for the analysis
fo <- Surv(time, status != 2) ~ sex + age + year + thickness + ulcer

## ------------------------------------------------------------------------
## Fit a generalized boosted model
gbmfit <- fit(fo, data = train, model = GBMModel)

## Predictor variable importance
(vi <- varimp(gbmfit))

plot(vi)

## ------------------------------------------------------------------------
## Predict survival probabilities and outcomes at specified follow-up times
times <- 365 * c(2, 5, 10)
predict(gbmfit, newdata = test, times = times, type = "prob") %>% head

predict(gbmfit, newdata = test, times = times) %>% head

## ------------------------------------------------------------------------
## Model performance metrics
obs <- response(fo, test)
pred <- predict(gbmfit, newdata = test, times = times, type = "prob")
performance(obs, pred, times = times)

## ------------------------------------------------------------------------
## Control parameters for repeated K-fold cross-validation
control <- CVControl(
  folds = 10,
  repeats = 5,
  surv_times = 365 * c(2, 5, 10)
)

## Metrics of interest
metrics <- c("ROC.mean", "Brier.mean")

## ------------------------------------------------------------------------
library(doParallel)
registerDoParallel(cores = 2)

## ------------------------------------------------------------------------
## Resample estimation
(res <- resample(fo, data = Melanoma, model = GBMModel, control = control))

summary(res)

plot(res, metrics = metrics)

## ------------------------------------------------------------------------
## Resample estimation
gbmres1 <- resample(fo, data = Melanoma, model = GBMModel(n.trees = 25), control = control)
gbmres2 <- resample(fo, data = Melanoma, model = GBMModel(n.trees = 50), control = control)
gbmres3 <- resample(fo, data = Melanoma, model = GBMModel(n.trees = 100), control = control)

## Combine resamples for comparison
(res <- Resamples(GBM1 = gbmres1, GBM2 = gbmres2, GBM3 = gbmres3))

summary(res)[, , metrics]

plot(res, metrics = metrics)
plot(res, metrics = metrics, type = "density")
plot(res, metrics = metrics, type = "errorbar")
plot(res, metrics = metrics, type = "violin")

## ------------------------------------------------------------------------
## Pairwise model comparisons
(perfdiff <- diff(res))

summary(perfdiff)[, , metrics]

plot(perfdiff, metrics = metrics)
t.test(perfdiff)[, , metrics]

## ------------------------------------------------------------------------
## Tune over a grid of model parameters
(gbmtune <- tune(fo, data = Melanoma, model = GBMModel,
                 grid = expand.grid(n.trees = c(25, 50, 100),
                                    interaction.depth = 1:3,
                                    n.minobsinnode = c(5, 10)),
                 control = control))

summary(gbmtune)[, , metrics]

plot(gbmtune, type = "line", metrics = metrics)

## ------------------------------------------------------------------------
## Fit the tuned model
gbmfit <- fit(fo, data = Melanoma, model = gbmtune)
(vi <- varimp(gbmfit))

plot(vi)

## ------------------------------------------------------------------------
## Stacked regression
stackedres <- resample(fo, data = Melanoma,
                       model = StackedModel(GBMModel, CForestModel, GLMNetModel(lambda = 0.1)))
summary(stackedres)

## Super learner
superres <- resample(fo, data = Melanoma,
                     model = SuperModel(GBMModel, CForestModel, GLMNetModel(lambda = 0.1)))
summary(superres)

## ----results = "hide"----------------------------------------------------
pd <- dependence(gbmfit, select = c(thickness, age))
plot(pd)

## ----results = "hide"----------------------------------------------------
cal <- calibration(res)
plot(cal, se = TRUE)

## ------------------------------------------------------------------------
## Requires a binary outcome
fo_surv5 <- factor(time > 365 * 5) ~ sex + age + year + thickness + ulcer
df_surv5 <- subset(Melanoma, status != 2)

res_surv5 <- resample(fo_surv5, data = df_surv5, model = GBMModel)
lf <- lift(res_surv5)
plot(lf, find = 75)

## ------------------------------------------------------------------------
### Pima Indians diabetes statuses (2 levels)
library(MASS)
res <- resample(factor(type) ~ ., data = Pima.tr, model = GBMModel)
summary(res)

## ------------------------------------------------------------------------
### Iris flowers species (3 levels)
res <- resample(factor(Species) ~ ., data = iris, model = GBMModel)
summary(res)

## ------------------------------------------------------------------------
### Boston housing prices
library(MASS)
res <- resample(medv ~ ., data = Boston, model = GBMModel)
summary(res)

## ------------------------------------------------------------------------
## Censored melanoma cancer survival times
library(survival)
res <- resample(Surv(time, status != 2) ~ ., data = Melanoma, model = GBMModel)
summary(res)

## ------------------------------------------------------------------------
## Formula specification
gbmfit <- fit(medv ~ ., data = Boston, model = GBMModel)
varimp(gbmfit)

## ------------------------------------------------------------------------
## Model frame specification
mf <- ModelFrame(medv ~ ., data = Boston, strata = medv)
gbmfit <- resample(mf, model = GBMModel)
summary(gbmfit)

## ------------------------------------------------------------------------
## Model frame specification with case weights
mf <- ModelFrame(ncases / (ncases + ncontrols) ~ agegp + tobgp + alcgp,
                 data = esoph, weights = ncases + ncontrols)
gbmfit <- fit(mf, model = GBMModel)
varimp(gbmfit)

## ------------------------------------------------------------------------
## Recipe specification
library(recipes)
rec <- recipe(medv ~ ., data = Boston) %>%
  add_role(medv, new_role = "case_strata") %>%
  step_center(all_predictors()) %>%
  step_scale(all_predictors()) %>%
  step_pca(all_predictors())

gbmfit <- resample(rec, model = GBMModel)
summary(gbmfit)

## ----echo = FALSE--------------------------------------------------------
info <- modelinfo()
types <- c("binary" = "b", "factor" = "f", "matrix" = "m", "numeric" = "n",
           "ordered" = "o", "Surv" = "S")
x <- lapply(names(info), function(modelname) {
  c(modelname, ifelse(names(types) %in% info[[modelname]]$types, types, NA))
})
df <- as.data.frame(do.call(rbind, x), stringsAsFactors = FALSE)
names(df) <- c("Constructor", names(types))

toString2 <- function(x) toString(na.omit(x))
df_classes <- data.frame(
  Method = sapply(info, getElement, name = "label"),
  Constructor = df$Constructor,
  Categorical = apply(df[c("binary", "factor", "ordered")], 1, toString2),
  Continuous = apply(df[c("matrix", "numeric")], 1, toString2),
  Survival = apply(df["Surv"], 1, toString2)
)
names(df_classes)[-(1:2)] <- paste0(names(df_classes)[-(1:2)],
                                    footnote_marker_number(1:3))

kable(df_classes, align = c("l", "c", "c", "c", "c"), row.names = FALSE,
      escape = FALSE) %>%
  kable_styling("striped", full_width = FALSE, position = "center") %>%
  add_header_above(c(" " = 1, " " = 1, "Response Variable Types" = 3)) %>%
  footnote(number = c("b = binary, f = factor, o = ordered",
                      "m = matrix, n = numeric",
                      "S = Surv"))

