df <- data.frame(
  contract = 1:10,
  x_attribute = c(0.92, 0.79, 1.00, 0.39, 0.68, 0.55, 0.73, 0.76, 1.00, 0.74),
  y_attribute = c(0.52, 0.19, 0.62, 1.00, 0.55, 0.52, 0.53, 0.46, 0.61, 0.84)
)

psc2 <- df %>%
  dplyr::mutate(x_SAVF_score = SAVF_score(x_attribute, 1, 5, .653),
         y_SAVF_score = SAVF_score(y_attribute, 1, 10, .7))

psc3 <- df %>%
  dplyr::mutate(x_SAVF_score = SAVF_score(x_attribute, 0, 1, .653),
                y_SAVF_score = SAVF_score(y_attribute, 0, 1, .7))

test_that("kraljic_quadrant provides proper messages and warnings", {

  expect_that(
    dplyr::mutate(psc2, quadrant = kraljic_quadrant(x_SAVF, y_SAVF_score)),
    throws_error()
  )

})

test_that("kraljic_quadrant has correct dimensions and output type", {

  expect_equal(dplyr::mutate(psc2, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% nrow(), 10)
  expect_equal(dplyr::mutate(psc2, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% ncol(), 6)
  expect_true(dplyr::mutate(psc2, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% is.data.frame())

})

test_that("kraljic_quadrant computes correctly", {

  expect_equal(dplyr::mutate(psc2, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% .[5, 6], "Bottleneck")
  expect_equal(dplyr::mutate(psc3, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% .[2, 6], "Non-critical")
  expect_equal(dplyr::mutate(psc3, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% .[3, 6], "Leverage")
  expect_equal(dplyr::mutate(psc3, quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score)) %>% .[4, 6], "Strategic")

})
