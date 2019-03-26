df <- data.frame(
  contract = 1:10,
  x_attribute = c(0.92, 0.79, 1.00, 0.39, 0.68, 0.55, 0.73, 0.76, 1.00, 0.74),
  y_attribute = c(0.52, 0.19, 0.62, 1.00, 0.55, 0.52, 0.53, 0.46, 0.61, 0.84)
)

psc3 <- df %>%
  dplyr::mutate(x_SAVF_score = SAVF_score(x_attribute, 0, 1, .653),
                y_SAVF_score = SAVF_score(y_attribute, 0, 1, .7))



test_that("kraljic_matrix creates a plot", {

  expect_true(kraljic_matrix(psc3, x_SAVF_score, y_SAVF_score) %>% ggplot2::is.ggplot())

})
