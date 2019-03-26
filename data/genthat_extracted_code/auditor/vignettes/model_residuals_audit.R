## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(message = FALSE)
knitr::opts_chunk$set(warning = FALSE)

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
lm_mr <- modelResiduals(lm_audit)
rf_mr <- modelResiduals(rf_audit)

head(lm_mr)

## ------------------------------------------------------------------------
lm_mr_district <- modelResiduals(lm_audit, variable = "district")
rf_mr_district <- modelResiduals(rf_audit, variable = "district")

lm_mr_fitted <- modelResiduals(lm_audit, variable = "Fitted values")
rf_mr_fitted <- modelResiduals(rf_audit, variable = "Fitted values")

head(lm_mr_district)

## ------------------------------------------------------------------------
lm_mr_surface <- modelResiduals(lm_audit, variable = "surface")
plot(lm_mr_surface, type = "ACF")

# alternative:
# plotACF(lm_audit, variable = "surface")

## ------------------------------------------------------------------------
plot(rf_mr_fitted, type = "Autocorrelation")

# alternative:
# plotAutocorrelation(rf_audit, variable = "Fitted values")

## ------------------------------------------------------------------------
rf_score_DW <- scoreDW(rf_audit, variable = "Fitted values")
rf_score_Runs <- scoreRuns(rf_audit, variable = "Fitted values")

rf_score_DW$score
rf_score_Runs$score

## ------------------------------------------------------------------------
plot(rf_mr, lm_mr, type = "ModelCorrelation")

# alternative:
# plotModelCorrelation(rf_audit, lm_audit)

## ------------------------------------------------------------------------
plot(rf_mr, lm_mr, type = "ModelPCA")

# alternative:
# plotModelPCA(rf_audit, lm_audit)

## ------------------------------------------------------------------------
lm_mr_m2 <- modelResiduals(lm_audit, variable = "m2.price")
rf_mr_m2 <- modelResiduals(rf_audit, variable = "m2.price")

plot(rf_mr_m2, lm_mr_m2, type = "Prediction")

# alternative:
# plotPrediction(rf_audit, lm_audit, variable = "m2.price")

## ------------------------------------------------------------------------
plot(rf_mr_fitted, lm_mr_fitted, type = "Residual")

# alternative:
# plotResidual(rf_audit, lm_audit, variable = "Fitted values")

## ------------------------------------------------------------------------
plot(rf_mr, lm_mr, type = "REC")

# alternative:
# plotREC(rf_audit, lm_audit)

## ------------------------------------------------------------------------
plot(rf_mr, type = "Residual")

# alternative:
# plotResidual(rf_audit)

## ------------------------------------------------------------------------
plot(rf_mr_fitted, lm_mr_fitted, type = "Residual")

# alternative:
# plotResidual(rf_audit, lm_audit, variable = "Fitted values")

## ------------------------------------------------------------------------
plot(lm_mr, rf_mr, type = "ResidualBoxplot")

# alternative
# plotResidualBoxplot(lm_audit, rf_audit)

## ------------------------------------------------------------------------
plot(rf_mr, lm_mr, type = "ResidualDensity")

# alternative
# plotResidualDensity(rf_audit, lm_audit)

## ------------------------------------------------------------------------
plotResidualDensity(lm_mr_m2, rf_mr_m2)

# alternative
# plotResidualDensity(rf_audit, lm_audit, variable = "m2.price")

## ------------------------------------------------------------------------
plotResidualDensity(lm_mr_district, rf_mr_district)

# alternative
# plotResidualDensity(rf_audit, lm_audit, variable = "district")

## ------------------------------------------------------------------------
plot(rf_mr, lm_mr, type = "RROC")

# alternative:
# plotRROC(rf_audit, lm_audit)

## ------------------------------------------------------------------------
plot(rf_mr_fitted, lm_mr_fitted, type = "ScaleLocation")

# alternative:
# plotScaleLocation(rf_audit, lm_audit, variable = "Fitted values")

## ------------------------------------------------------------------------
plot(rf_mr, lm_mr, type = "TwoSidedECDF")

# alternative
# TwoSidedECDF(rf_audit, lm_audit)

