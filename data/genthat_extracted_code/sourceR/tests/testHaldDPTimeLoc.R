context("Test time/location data structure")

testdata = function()
{
  # Test priors
  priors <-
    list(
      a_theta = 0.01,
      b_theta = 0.00001,
      a_alpha = 1,
      a_r = 0.1
    )
  # Data
  set.seed(1)
  types = unique(sim_SA$cases$Type)[1:10]

  X = filter(sim_SA$sources, Type %in% types)
  y = filter(sim_SA$cases, Type %in% types)
  list(
    y = y,
    X = X,
    prior = priors,
    prev = sim_SA$prev
  )
}

test_that("Detect y/X data mismatch", {
  dat = testdata()
  y = Y(
    data = dat$y,
    y = 'Human',
    type = 'Type',
    time = 'Time',
    location = 'Location'
  )
  x = X(
    data = dat$X,
    x = 'Count',
    type = 'Type',
    time = 'Time',
    source = 'Source'
  )
  k = Prev(dat$prev,
           prev = 'Value',
           time = 'Time',
           source = 'Source')

  expect_silent(HaldDP(
    y = y,
    x = x,
    k = k,
    priors = dat$prior,
    a_q = 0.1
  ))

  dat$X = dat$X[dat$X$Time == '1', ]
  x = X(
    data = dat$X,
    x = 'Count',
    type = 'Type',
    time = 'Time',
    source = 'Source'
  )
  expect_error(HaldDP(
    y = y,
    x = x,
    k = k,
    priors = dat$prior,
    a_q = 0.1
  ),
  "Times in x and y do not match")
})

test_that("Test time/location data structures", {
  testthat::skip_on_cran()
  dat = testdata()

  y = Y(
    data = dat$y,
    y = 'Human',
    type = 'Type',
    time = 'Time',
    location = 'Location'
  )
  x = X(
    data = dat$X,
    x = 'Count',
    type = 'Type',
    time = 'Time',
    source = 'Source'
  )
  k = Prev(dat$prev,
           prev = 'Value',
           time = 'Time',
           source = 'Source')
  model = HaldDP(
    y = y,
    x = x,
    k = k,
    priors = dat$prior,
    a_q = 0.1
  )
  model$mcmc_params(n_iter = 100,
                    burn_in = 0,
                    thin = 1)
  capture.output(model$update())
  expect_equal_to_reference(model$summary(), "haldDPdataStrct.rds")
})

test_that("Prior and init", {
  testthat::skip_on_cran()
  dat = testdata()

  # Data formatting
  y = Y(
    data = dat$y,
    y = 'Human',
    type = 'Type',
    time = 'Time',
    location = 'Location'
  )
  x = X(
    data = dat$X,
    x = 'Count',
    type = 'Type',
    time = 'Time',
    source = 'Source'
  )
  k = Prev(dat$prev,
           prev = 'Value',
           time = 'Time',
           source = 'Source')

  # Format priors
  alphaPrior = expand.grid(
    source = unique(dat$X$Source),
    time = unique(dat$X$Time),
    location = unique(dat$y$Location)
  )
  alphaPrior$alpha = rep(0.1, nrow(alphaPrior))
  dat$prior$a_alpha = Alpha(
    data = alphaPrior,
    alpha = 'alpha',
    source = 'source',
    time = 'time',
    location = 'location'
  )

  rPrior = dat$X
  rPrior$r = rep(0.1, nrow(rPrior))
  dat$prior$r = X(
    data = rPrior,
    x = 'r',
    type = 'Type',
    time = 'Time',
    source = 'Source'
  )

  # Initial values
  init = list()
  init$alpha = Alpha(
    data = alphaPrior,
    alpha = 'alpha',
    source = 'source',
    time = 'time',
    location = 'location'
  )
  init$alpha$x = apply(init$alpha$x, c('time', 'location'), function(x)
    x / sum(x)) # Normalise alpha vectors
  init$r = X(
    data = rPrior,
    x = 'r',
    type = 'Type',
    time = 'Time',
    source = 'Source'
  )

  model = NULL
  expect_silent({
    model = HaldDP(
      y = y,
      x = x,
      k = k,
      priors = dat$prior,
      a_q = 0.1,
      inits = init
    )
  })

  model$mcmc_params(n_iter = 100,
                    burn_in = 0,
                    thin = 1)
  capture.output(model$update())
  expect_equal_to_reference(model$summary(), "haldDPpriorInit.rds")
  expect_equal_to_reference(model$summary(flatten=T), "haldDPres4.rds")
})
