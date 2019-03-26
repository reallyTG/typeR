context("auc_compare results using sample data")

test_that("z-score properties are correct", {
  data("sample_experiment_data")
  expect_equal(
    auc_compare(sample_experiment_data, compare_values = c("VariantA", "VariantB"), filter_value = c("ModelC"), time_col = "time", outcome_col = "auc", compare_col = "model_variant", over_col = "dataset", filter_col = "model_id"),
    (-1)*auc_compare(sample_experiment_data, compare_values = c("VariantB", "VariantA"), filter_value = c("ModelC"), time_col = "time", outcome_col = "auc", compare_col = "model_variant", over_col = "dataset", filter_col = "model_id")
  )
  expect_equal(
    abs(auc_compare(sample_experiment_data, compare_values = c("VariantA", "VariantB"), filter_value = c("ModelC"), time_col = "time", outcome_col = "auc", compare_col = "model_variant", over_col = "dataset", filter_col = "model_id")),
    abs(auc_compare(sample_experiment_data, compare_values = c("VariantB", "VariantA"), filter_value = c("ModelC"), time_col = "time", outcome_col = "auc", compare_col = "model_variant", over_col = "dataset", filter_col = "model_id"))
  )
})
