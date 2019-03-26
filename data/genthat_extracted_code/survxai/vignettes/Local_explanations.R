## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      message = FALSE,
                      warning = FALSE)

## ----dataset-------------------------------------------------------------
data(pbc, package = "randomForestSRC")
pbc <- pbc[complete.cases(pbc),]

head(pbc)

## ------------------------------------------------------------------------
pbc$sex <- as.factor(pbc$sex)
pbc$stage <- as.factor(pbc$stage)

## ---- models-------------------------------------------------------------
set.seed(1024)
library(rms)
library(survxai)

pbc_smaller <- pbc[,c("days", "status", "treatment", "sex", "age", "bili", "stage")]
head(pbc_smaller)

cph_model <- cph(Surv(days/365, status)~. , data = pbc_smaller, surv = TRUE, x = TRUE, y=TRUE)

## ---- explainer----------------------------------------------------------

predict_times <- function(model, data, times){
  prob <- rms::survest(model, data, times = times)$surv
  return(prob)
}

surve_cph <- explain(model = cph_model,
                  data = pbc_smaller[,-c(1,2)], y = Surv(pbc_smaller$days/365, pbc_smaller$status),
                  predict_function = predict_times)

print(surve_cph)

## ---- single observation-------------------------------------------------
single_observation <- pbc_smaller[1,-c(1,2)]
single_observation

## ---- ceteris paribus----------------------------------------------------
cp_cph <- ceteris_paribus(surve_cph, single_observation)
print(cp_cph)

## ---- fig.height=6-------------------------------------------------------
plot(cp_cph, scale_type = "gradient", scale_col = c("red", "blue"), ncol = 2)

## ---- fig.height=3-------------------------------------------------------
plot(cp_cph, selected_variable = "stage", scale_type = "gradient", scale_col = c("red", "blue"))

## ---- prediction breakdown-----------------------------------------------
broken_prediction_cph <- prediction_breakdown(surve_cph, pbc_smaller[1,-c(1,2)])
print(broken_prediction_cph)

## ------------------------------------------------------------------------
plot(broken_prediction_cph, scale_col = c("red", "blue"))

