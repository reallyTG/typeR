context('fitCurve()')

## Input and expected data
# Use EIC aggregated (sum) from raw data extracted from file ko15.CDf from the pkg faahKO with rt=c(3362.102, 3409.051), mz=c(496., 498.), msLevel=1
EIC_rt  <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057, 3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577, 3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096, 3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
EIC_int <- c(51048, 81568, 138288, 233920, 376448, 557288, 753216, 938048, 1091840, 1196992, 1261056, 1308992, 1362752, 1406592, 1431360, 1432896, 1407808, 1345344, 1268480, 1198592, 1126848, 1036544, 937600, 849792, 771456, 692416, 614528, 546088, 492752, 446464, 400632)
EIC     <- data.frame(rt=EIC_rt, int=EIC_int)

input_params  <- list( init_params  = list(amplitude=1E7, center=3400, sigma=1, gamma=1),
                       lower_bounds = list(amplitude=0,   center=3397, sigma=0, gamma=-0.1),
                       upper_bounds = list(amplitude=1E9, center=3403, sigma=5, gamma=5))

test_that('fit skewedGaussian, guess params, no lower, no upper', {
  # Input and expected results
  expected_fit        <- list(amplitude=275371.05624872464, center=3382.577, sigma=0.079046969170787212, gamma=0.0011476465885767637, fitStatus=2, curveModel="skewedGaussian")
  class(expected_fit) <- 'peakPantheR_curveFit'
  
  result_fit    <- fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params='guess')
  
  # Check results
  expect_equal(result_fit, expected_fit)
})

test_that('fit skewedGaussian, input params', {
  # Input and expected results
  expected_fit        <- list(amplitude=13203571.527336178, center=3403, sigma=5, gamma=-0.1, fitStatus=1, curveModel="skewedGaussian")
  class(expected_fit) <- 'peakPantheR_curveFit'
  
  result_fit    <- fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=input_params)
  
  # Check results
  expect_equal(result_fit, expected_fit)
})

test_that('raises error()', {
  # length x y doesn't match
  expect_error(fitCurve(x=EIC$rt, y=EIC$int[1:20], curveModel='skewedGaussian', params='guess'), 'Error: length of "x" and "y" must match!', fixed=TRUE)

  # unknown curveModel
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='unknownModel', params='guess'), 'Error: "curveModel" must be one of: skewedGaussian', fixed=TRUE)
  
  # params is not a list or character
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=5), 'Error: "params" must be a list or "guess"', fixed=TRUE)
  
  # no init_params
  tmp_params1 <- list(lower_bounds = input_params$lower_bounds,
                      upper_bounds = input_params$upper_bounds)
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=tmp_params1), 'Error: "params must be a list of "init_params", "lower_bounds" and "upper_bounds"', fixed=TRUE)
  
  # no lower_bounds
  tmp_params2 <- list(init_params  = input_params$init_params,
                      upper_bounds = input_params$upper_bounds)
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=tmp_params2), 'Error: "params must be a list of "init_params", "lower_bounds" and "upper_bounds"', fixed=TRUE)
  
  # no upper_bounds
  tmp_params3 <- list(init_params  = input_params$init_params,
                      lower_bounds = input_params$lower_bounds)
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=tmp_params3), 'Error: "params must be a list of "init_params", "lower_bounds" and "upper_bounds"', fixed=TRUE)
  
  # init_params not a list
  tmp_params4 <- list(init_params  = 'not a list',
                      lower_bounds = input_params$lower_bounds,
                      upper_bounds = input_params$upper_bounds)
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=tmp_params4), 'Error: "params$init_params" must be a list of parameters', fixed=TRUE)
  
  # lower_params not a list
  tmp_params5 <- list(init_params  = input_params$init_params,
                      lower_bounds = 'not a list',
                      upper_bounds = input_params$upper_bounds)
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=tmp_params5), 'Error: "params$lower_bounds" must be a list of parameters', fixed=TRUE)
  
  # upper_params not a list
  tmp_params6 <- list(init_params  = input_params$init_params,
                      lower_bounds = input_params$lower_bounds,
                      upper_bounds = 'not a list')
  expect_error(fitCurve(x=EIC$rt, y=EIC$int, curveModel='skewedGaussian', params=tmp_params6), 'Error: "params$upper_bounds" must be a list of parameters', fixed=TRUE)
})
