## ---- warning=FALSE, message=FALSE---------------------------------------
library("DALEX")
head(HR)

## ---- warning=FALSE, message=FALSE---------------------------------------
library("randomForest")
library("ceterisParibus")
set.seed(59)

model <- randomForest(status ~ gender + age + hours + evaluation + salary, data = HR)

## ---- warning=FALSE, message=FALSE---------------------------------------
pred1 <- function(m, x)   predict(m, x, type = "prob")[,1]
pred2 <- function(m, x)   predict(m, x, type = "prob")[,2]
pred3 <- function(m, x)   predict(m, x, type = "prob")[,3]

explainer_rf_fired <- explain(model, data = HR[,1:5], 
                              y = HR$status == "fired", 
                              predict_function = pred1, label = "fired")
explainer_rf_ok <- explain(model, data = HR[,1:5], 
                              y = HR$status == "ok", 
                              predict_function = pred2, label = "ok")
explainer_rf_promoted <- explain(model, data = HR[,1:5], 
                               y = HR$status == "promoted", 
                               predict_function = pred3, label = "promoted")

## ---- warning=FALSE, message=FALSE---------------------------------------
cp_rf1 <- ceteris_paribus(explainer_rf_fired, HR[1,])
cp_rf2 <- ceteris_paribus(explainer_rf_ok, HR[1,])
cp_rf3 <- ceteris_paribus(explainer_rf_promoted, HR[1,])

plot(cp_rf1, cp_rf2, cp_rf3, 
     alpha = 0.5, color="_label_", size_points = 4)

## ---- warning=FALSE, message=FALSE---------------------------------------
cp_rf_fired <- ceteris_paribus(explainer_rf_fired, HR[1:10,])

plot(cp_rf_fired, color = "gender")

## ---- warning=FALSE, message=FALSE---------------------------------------
cp_rf1 <- ceteris_paribus(explainer_rf_fired, HR[1:100,])
cp_rf2 <- ceteris_paribus(explainer_rf_ok, HR[1:100,])
cp_rf3 <- ceteris_paribus(explainer_rf_promoted, HR[1:100,])

plot(cp_rf1, cp_rf2, cp_rf3, 
     aggregate_profiles = mean, 
     alpha = 1, show_observations = FALSE, color="_label_")

## ---- warning=FALSE, message=FALSE---------------------------------------
cp_rfF <- ceteris_paribus(explainer_rf_fired, 
                          HR[which(HR$gender == "female")[1:100],])
cp_rfF$`_label_` = "Fired Female"
cp_rfM <- ceteris_paribus(explainer_rf_fired, 
                          HR[which(HR$gender == "male")[1:100],])
cp_rfM$`_label_` = "Fired Male"

plot(cp_rfM, cp_rfF, 
     aggregate_profiles = mean, 
     alpha = 1, show_observations = FALSE, color="_label_")

## ---- warning=FALSE, message=FALSE---------------------------------------
library("ceterisParibus")
library("e1071")

model_rf <- randomForest(status ~ gender + age + hours + evaluation + salary, data = HR)
pred_rf_fired <- function(m, x)   predict(m, x, type = "prob")[,1]

explainer_rf_fired <- explain(model, data = HR[,1:5], 
                              y = HR$status == "fired", 
                              predict_function = pred_rf_fired)

## ---- warning=FALSE, message=FALSE---------------------------------------
model_fired <- glm(status == "fired" ~ gender + age + hours + evaluation + salary, data = HR, family = "binomial")

pred_glm_fired <- function(m, x)   predict.glm(m, x, type = "response")

explainer_glm_fired <- explain(model_fired, data = HR[,1:5], 
                              y = HR$status == "fired", 
                              predict_function = pred_glm_fired)

## ---- warning=FALSE, message=FALSE---------------------------------------
model_svm_fired <- svm(status ~ gender + age + hours + evaluation + salary, data = HR, probability = TRUE)

pred_svm_fired <- function(m, x) attr(predict(m, x, probability = TRUE), "probabilities")[,1]

explainer_svm_fired <- explain(model_svm_fired, data = HR[,1:5], 
                              y = HR$status == "fired", 
                              predict_function = pred_svm_fired)

## ---- warning=FALSE, message=FALSE---------------------------------------
new_obs <- HR[1,]

cp_rf <- ceteris_paribus(explainer_rf_fired, new_obs)
cp_glm <- ceteris_paribus(explainer_glm_fired, new_obs)
cp_svm <- ceteris_paribus(explainer_svm_fired, new_obs)

## ---- warning=FALSE, message=FALSE---------------------------------------
plot(cp_rf, cp_glm, cp_svm,
     alpha = 0.5, size_points = 3, color="_label_")

## ---- warning=FALSE, message=FALSE---------------------------------------
cp_rf <- ceteris_paribus(explainer_rf_fired, HR[1:100,])
cp_glm <- ceteris_paribus(explainer_glm_fired, HR[1:100,])
cp_svm <- ceteris_paribus(explainer_svm_fired, HR[1:100,])

plot(cp_rf, cp_glm, cp_svm,
     aggregate_profiles = mean, 
     alpha = 1, show_observations = FALSE, color="_label_")

## ---- warning=FALSE, message=FALSE---------------------------------------
percent <- function (x) 
    paste0(format(round(x, 2) * 100, big.mark = ",", scientific = FALSE, trim = TRUE), "%")

data_1 <- HR[1,]
cp_rf3 <- ceteris_paribus(explainer_rf_promoted, data_1)

plot(cp_rf3, 
     alpha = 0.5, size_points = 4, selected_variables = "hours", 
     as.gg = TRUE) + xlab("") +  scale_y_continuous(limits=c(0,1), name = "Pr(promoted)", labels =percent) + theme_light()

cp_rf1 <- ceteris_paribus(explainer_rf_fired, HR[1,])
cp_rf2 <- ceteris_paribus(explainer_rf_ok, HR[1,])
cp_rf3 <- ceteris_paribus(explainer_rf_promoted, HR[1,])

plot(cp_rf1, cp_rf2, cp_rf3, 
     alpha = 0.5, color="_label_", size_points = 4, selected_variables = "hours", 
     as.gg = TRUE) + xlab("") +  scale_y_continuous(limits=c(0,1), name = "Pr(promoted)", labels = percent) + theme_light() + scale_color_discrete(name = "class")


## ---- warning=FALSE, message=FALSE---------------------------------------
sessionInfo()

