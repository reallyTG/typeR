## ---- echo=FALSE, results='hide'-----------------------------------------
library(auctestr)

## ------------------------------------------------------------------------
data("sample_experiment_data", package="auctestr")
head(sample_experiment_data, 15)

## ------------------------------------------------------------------------
# compare model A and model B, only evaluating VariantC of both models
z_score = auc_compare(sample_experiment_data, compare_values = c("ModelA", "ModelB"), filter_value = c("VariantC"), time_col = "time", outcome_col = "auc", compare_col = "model_id", over_col = "dataset", filter_col = "model_variant")
z_score
# fetch p-value of this comparison
pnorm(-abs(z_score))

## ------------------------------------------------------------------------
z_score = auc_compare(sample_experiment_data, compare_values = c("VariantA", "VariantB"), filter_value = c("ModelC"), time_col = "time", outcome_col = "auc", compare_col = "model_variant", over_col = "dataset", filter_col = "model_id")
z_score
pnorm(-abs(z_score))

