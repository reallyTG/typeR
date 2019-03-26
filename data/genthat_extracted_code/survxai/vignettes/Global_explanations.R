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
pbc_smaller$years <- pbc_smaller$days/356
pbc_smaller <- pbc_smaller[,-1]
head(pbc_smaller)
cph_model <- cph(Surv(years, status)~., data = pbc_smaller, surv = TRUE, x = TRUE, y=TRUE)

## ---- explainer----------------------------------------------------------

surve_cph <- explain(model = cph_model,
                     data = pbc_smaller[,-c(1,7)], 
                     y = Surv(pbc_smaller$years, pbc_smaller$status))
print(surve_cph)

## ------------------------------------------------------------------------
mp_cph <- model_performance(surve_cph)
print(mp_cph)

## ------------------------------------------------------------------------
plot(mp_cph)

## ------------------------------------------------------------------------
vr_cph_sex <- variable_response(surve_cph, "sex")
print(vr_cph_sex)
vr_cph_bili <- variable_response(surve_cph, "bili")

## ------------------------------------------------------------------------
plot(vr_cph_sex)

## ------------------------------------------------------------------------
plot(vr_cph_bili)

