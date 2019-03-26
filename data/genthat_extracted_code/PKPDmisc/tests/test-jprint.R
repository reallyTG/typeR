context("jprint")

missing_cols <- c("WT", "HT", "OCC")

test_that("expectation warns user if named replacement not found in original list", {
  expect_message(jprint("missing columns: ", missing_cols), "missing columns:  WT, HT, OCC")
  expect_message(jprint("missing columns: ", missing_cols, sep_vector=";"), "missing columns:  WT;HT;OCC")
  expect_message(jprint("missing cols", missing_cols, sep_atomic=":"), "missing cols:WT, HT, OCC")
})