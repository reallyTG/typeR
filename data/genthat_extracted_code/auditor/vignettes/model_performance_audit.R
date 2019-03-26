## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)

## ------------------------------------------------------------------------
library(DALEX)
data("apartments")
head(apartments)

## ------------------------------------------------------------------------
lm_model <- lm(m2.price ~ construction.year + surface + floor + no.rooms + district, data = apartments)

## ------------------------------------------------------------------------
library("randomForest")
set.seed(59)
rf_model <- randomForest(m2.price ~ construction.year + surface + floor +  no.rooms + district, data = apartments)

## ------------------------------------------------------------------------
library("auditor")

lm_audit <- audit(lm_model, label = "lm", data = apartmentsTest, y = apartmentsTest$m2.price)
rf_audit <- audit(rf_model, label = "rf", data = apartmentsTest, y = apartmentsTest$m2.price)

## ------------------------------------------------------------------------
lm_mp <- modelPerformance(lm_audit, scores = c("MAE", "MSE", "REC", "RROC"))
rf_mp <- modelPerformance(rf_audit, scores = c("MAE", "MSE", "REC", "RROC"))

lm_mp

## ------------------------------------------------------------------------
plot(lm_mp, rf_mp, table = TRUE)

## ------------------------------------------------------------------------
new_score <- function(object) sum((object$residuals)^3)

lm_mp <- modelPerformance(lm_audit,  
                          scores = c("MAE", "MSE", "REC", "RROC"), 
                          new.score = new_score)

rf_mp <- modelPerformance(rf_audit,  
                          scores = c("MAE", "MSE", "REC", "RROC"), 
                          new.score = new_score)

plotModelRanking(lm_mp, rf_mp, table = TRUE)

