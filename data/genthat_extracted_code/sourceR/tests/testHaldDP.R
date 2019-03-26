context("Test HaldDP model")

# Test data structure
dat <- structure(
  list(
    Human = c(7L, 1L, 13L, 19L, 41L, 42L, 23L, 17L),
    ChickenA = c(0L, 2L, 0L, 4L, 36L, 1L, 5L, 6L),
    ChickenB = c(1L,
                 0L, 0L, 0L, 15L, 27L, 21L, 0L),
    ChickenC = c(0L, 2L, 0L, 0L,
                 23L, 7L, 13L, 0L),
    Bovine = c(4L, 0L, 1L, 11L, 2L, 0L, 12L, 0L),
    Ovine = c(1L, 0L, 0L, 18L, 2L, 0L, 22L, 0L),
    Environment = c(0L,
                    1L, 0L, 1L, 16L, 0L, 1L, 0L),
    Time = structure(
      c(1L, 1L, 1L,
        1L, 1L, 1L, 1L, 1L),
      .Label = "1",
      class = "factor"
    ),
    Location = structure(
      c(1L,
        1L, 1L, 1L, 1L, 1L, 1L, 1L),
      .Label = "A",
      class = "factor"
    ),
    Type = structure(
      c(1L, 2L, 3L, 4L, 5L, 6L, 8L, 10L),
      .Label = c("21",
                 "25", "38", "42", "45", "48", "5", "50", "51", "52"),
      class = "factor"
    )
  ),
  .Names = c(
    "Human",
    "ChickenA",
    "ChickenB",
    "ChickenC",
    "Bovine",
    "Ovine",
    "Environment",
    "Time",
    "Location",
    "Type"
  ),
  row.names = c(21L, 25L, 38L, 42L,
                45L, 48L, 50L, 52L),
  class = "data.frame"
)

# Test prevalence
k <- data.frame(
  Value = rep(1, 6),
  Source = unique(campy$sources$Source),
  Time = rep("1", 6)
)
# Test priors
priors <-
  list(
    a_theta = 0.01,
    b_theta = 0.00001,
    a_alpha = 1,
    a_r = 0.1
  )


# Test suite
test_that("HaldDP model construction", {
  testthat::skip_on_cran()
  set.seed(1)
  y = Y(dat, y = 'Human', type = 'Type')
  src = reshape2::melt(
    dat,
    id.vars = c('Time', 'Type'),
    measure.vars = c(
      'ChickenA',
      'ChickenB',
      'ChickenC',
      'Bovine',
      'Ovine',
      'Environment'
    ),
    variable.name = 'Source',
    value.name = 'Count'
  )
  x = X(src,
        x = 'Count',
        type = 'Type',
        source = 'Source')
  k = Prev(k, prev = 'Value', source = 'Source')

  model <- HaldDP(
    y = y,
    x = x,
    k = k,
    priors = priors,
    a_q = 0.1
  )
  model$mcmc_params(n_iter = 100,
                   burn_in = 0,
                   thin = 1)
  # Test model barfs if summary called on empty posterior
  expect_error(model$summary())
  capture.output(model$update())
  expect_equal_to_reference(model$summary(), "haldDPres1.rds")
  capture.output(model$update(n_iter = 100))
  expect_equal_to_reference(model$summary(), "haldDPres2.rds")
  expect_equal_to_reference(model$extract('xi'), "haldDPlambdaj.rds")
  expect_equal_to_reference(model$extract(flatten = TRUE), 'haldDPFlat.rds')
  model$mcmc_params(n_iter = 100,
                   burn_in = 10,
                   thin = 5)
  expect_error(model$summary())
  capture.output(model$update())
  expect_equal_to_reference(model$summary(), "haldDPres3.rds")
})
