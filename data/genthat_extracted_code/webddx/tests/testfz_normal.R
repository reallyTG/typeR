context("FindZebra API client")
library("webddx")

test_that("query_fz works for a simple query", {
  NUM_ROWS <- 5
  FIELDS <- c("display_title", "retrieved_date", "source", "score")
  tester_df <- query_fz(c("muscle pain", "fatigue"),
                        num_rows = NUM_ROWS,
                        fields = FIELDS)
  
  expect_equal(nrow(tester_df), NUM_ROWS)
  expect_equal(ncol(tester_df), length(FIELDS))
})