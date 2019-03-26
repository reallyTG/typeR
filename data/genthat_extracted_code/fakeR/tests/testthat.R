library(testthat)
library(fakeR)

test_that("All variable types consistent", {
  state_df <- data.frame(division=state.division)
  state_df$division <- as.character(state_df$division)
  state_df$area <- state.area
  state_df$region <- state.region
  state_sim <- simulate_dataset(state_df)
  
  state_df <- state_df[,order(names(state_df))]
  state_sim <- state_sim[,order(names(state_sim))]
  
  col_types <- sapply(state_df, class)
  sim_types <- sapply(state_sim, class)
  expect_equal(col_types, sim_types)
  expect_equal(length(col_types), length(sim_types))
})


