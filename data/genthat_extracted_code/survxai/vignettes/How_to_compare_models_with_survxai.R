## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      message = FALSE,
                      warning = FALSE)

## ----dataset-------------------------------------------------------------
data(pbc, package = "randomForestSRC")
pbc <- pbc[complete.cases(pbc),]
pbc_smaller <- pbc[,c("days", "status","sex", "bili", "stage")]
pbc_smaller$years <- pbc$days/365
pbc_smaller <- pbc_smaller[,-1]
head(pbc_smaller)

## ------------------------------------------------------------------------
pbc_smaller$sex <- as.factor(pbc_smaller$sex)
pbc_smaller$stage <- as.factor(pbc_smaller$stage)

## ------------------------------------------------------------------------
smp_size <- floor(0.5 * nrow(pbc_smaller))
set.seed(123)
train_ind <- sample(seq_len(nrow(pbc_smaller)), size = smp_size)

train <- pbc_smaller[train_ind, ]
test <- pbc_smaller[-train_ind, ]

## ---- models-------------------------------------------------------------
library(rms)

cph_model <- cph(Surv(years, status)~., data = train, surv = TRUE, x = TRUE, y=TRUE)

## ------------------------------------------------------------------------
library(randomForestSRC)
set.seed(1994)
rf_model <- rfsrc(Surv(years, status)~., data = train)

## ------------------------------------------------------------------------
library(survival)
reg_model <- survreg(Surv(years, status)~., data = train, x = TRUE)

## ------------------------------------------------------------------------
library(survxai)

surve_cph <- explain(model = cph_model,
                     data = test[,-c(1,5)], 
                     y = Surv(test$years, test$status))

print(surve_cph)
surve_rf <- explain(model = rf_model, 
                     label = "random forest",
                     data = test[,-c(1,5)], 
                     y = Surv(test$years, test$status))

print(surve_rf)

## ------------------------------------------------------------------------
library(CFC)

custom_predict <- function(model, newdata, times){
  times <- sort(times)
  vars <- all.vars(model$call[[2]][[2]])
  n_vars <- which(colnames(newdata) %in% vars)
  if(length(n_vars)>0){
    newdata <- newdata[,-c(n_vars)]
  }
  model$x <- model.matrix(~., newdata)
  res <- matrix(ncol = length(times), nrow = nrow(newdata))
  for(i in 1:nrow(newdata)) {
    res[i,] <- cfc.survreg.survprob(t = times, args = model, n = i)    
  }
  return(res)
}

surve_reg <- explain(model = reg_model,
                     data = test[,-c(1,5)], 
                     y = Surv(test$years, test$status),
                     predict_function = custom_predict)
print(surve_reg)

## ------------------------------------------------------------------------
mp_cph <- model_performance(surve_cph)
mp_rf <- model_performance(surve_rf)
mp_reg <- model_performance(surve_reg)

## ------------------------------------------------------------------------
print(mp_cph)

## ------------------------------------------------------------------------
plot(mp_cph, mp_rf, mp_reg) + ylim(c(0,0.30))

## ------------------------------------------------------------------------
vr_cph_sex <- variable_response(surve_cph, "sex")
vr_rf_sex <- variable_response(surve_rf, "sex")
vr_reg_sex <- variable_response(surve_reg, "sex")

## ------------------------------------------------------------------------
print(vr_cph_sex)

## ---- fig.height=10------------------------------------------------------
plot(vr_cph_sex, vr_rf_sex, vr_reg_sex)

## ------------------------------------------------------------------------
plot(vr_cph_sex, vr_rf_sex, vr_reg_sex, split = "variable")


## ------------------------------------------------------------------------
vr_cph_bili <- variable_response(surve_cph, "bili")
vr_rf_bili <- variable_response(surve_rf, "bili")
vr_reg_bili <- variable_response(surve_reg, "bili")

## ---- fig.height=10------------------------------------------------------
plot(vr_cph_bili, vr_rf_bili, vr_reg_bili)

## ---- fig.height=10------------------------------------------------------
plot(vr_cph_bili, vr_rf_bili, vr_reg_bili, split = "variable")

## ------------------------------------------------------------------------
single_observation <- test[1,-c(1,5)]
single_observation

## ------------------------------------------------------------------------
cp_cph <- ceteris_paribus(surve_cph, single_observation)
cp_rf <- ceteris_paribus(surve_rf, single_observation)
cp_reg <- ceteris_paribus(surve_reg, single_observation)

## ------------------------------------------------------------------------
print(cp_cph)

## ---- fig.height=10------------------------------------------------------
plot(cp_cph, scale_type = "gradient", scale_col = c("red", "blue"))

plot(cp_rf, scale_type = "gradient", scale_col = c("red", "blue"))
plot(cp_reg, scale_type = "gradient", scale_col = c("red", "blue"))

## ------------------------------------------------------------------------
broken_prediction_cph <- prediction_breakdown(surve_cph, single_observation)
broken_prediction_rf <- prediction_breakdown(surve_rf, single_observation)
broken_prediction_reg <- prediction_breakdown(surve_reg, single_observation)

## ------------------------------------------------------------------------
print(broken_prediction_cph)

## ------------------------------------------------------------------------
plot(broken_prediction_cph, scale_col = c("red", "blue"), lines_type = 2)
plot(broken_prediction_rf, scale_col = c("red", "blue"), lines_type = 2)
plot(broken_prediction_reg, scale_col = c("red", "blue"), lines_type = 2)

## ------------------------------------------------------------------------
broken_prediction_cph <- prediction_breakdown(surve_cph, single_observation, prob = 0.8)
broken_prediction_rf <- prediction_breakdown(surve_rf, single_observation, prob = 0.8)
broken_prediction_reg <- prediction_breakdown(surve_reg, single_observation, prob = 0.8)

## ------------------------------------------------------------------------
plot(broken_prediction_cph, scale_col = c("red", "blue"), lines_type = 2)
plot(broken_prediction_rf, scale_col = c("red", "blue"), lines_type = 2)
plot(broken_prediction_reg, scale_col = c("red", "blue"), lines_type = 2)

## ---- fig.height=10------------------------------------------------------
plot(broken_prediction_cph, broken_prediction_rf, broken_prediction_reg, scale_col = c("red", "blue"), lines_type = 2)

