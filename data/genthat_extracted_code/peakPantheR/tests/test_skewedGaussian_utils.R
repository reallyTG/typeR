context('skewedGaussian utils')

## Input and expected data
# Use EIC aggregated (sum) from raw data extracted from file ko15.CDf from the pkg faahKO with rt=c(3362.102, 3409.051), mz=c(496., 498.), msLevel=1
EIC_rt  <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057, 3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577, 3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096, 3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
EIC_int <- c(51048, 81568, 138288, 233920, 376448, 557288, 753216, 938048, 1091840, 1196992, 1261056, 1308992, 1362752, 1406592, 1431360, 1432896, 1407808, 1345344, 1268480, 1198592, 1126848, 1036544, 937600, 849792, 771456, 692416, 614528, 546088, 492752, 446464, 400632)
EIC     <- data.frame(rt=EIC_rt, int=EIC_int)

test_that('skew_erf(), Gaussian Error function', {
  # Input / result
  x   <- c(0., 0.0001, 0.001, 0.01, 0.1, 1., 2., 5.)
  err <- c(0.0000000000, 0.0001128379, 0.0011283788, 0.0112834156, 0.1124629160, 0.8427007929, 0.9953222650, 1.0000000000)
  
  # Check results
  expect_equal(skew_erf(x), err)
})

test_that('skewedGaussian_minpack.lm()', {
  # Input / result
  in_param  <- list(amplitude=161883.8, center=3341.888, sigma=0.07861783, gamma=0.001827597)
  out_yy    <- c(3.84041826812650e+05, 3.20292015166555e+05, 2.62601018167395e+05, 2.11679505823677e+05, 1.67780891619003e+05, 1.30778444232705e+05, 1.00255416511354e+05, 7.55970175062893e+04, 5.60754316276598e+04, 4.09219593516838e+04, 2.93832078124252e+04, 2.07607215703875e+04, 1.44352970233798e+04, 9.87840066705357e+03, 6.65366075630891e+03, 4.41144677862575e+03, 2.87924627712906e+03, 1.85004664967478e+03, 1.17035890337313e+03, 7.28974137164955e+02, 4.47078502904309e+02, 2.70082190876356e+02, 1.60615117796608e+02, 9.40608311004585e+01, 5.42471698666244e+01, 3.08108378037599e+01, 1.72345036785028e+01, 9.49450181124733e+00, 5.15147618337815e+00, 2.75286019310266e+00, 1.44888983056409e+00)
  
  result <- skewedGaussian_minpack.lm(params=in_param, xx=EIC$rt)
  
  # Check results
  expect_equal(result, out_yy)
})

test_that('skewedGaussian_minpack.lm_objectiveFun()', {
  # Input / result
  in_param  <- list(amplitude=161883.8, center=3341.888, sigma=0.07861783, gamma=0.001827597)
  out_res   <- c(-380679.7248, -316928.3482, -259235.7862, -208312.7088, -164412.5296, -127408.5172, -96883.9245, -72223.9605, -52700.8096, -37545.7724, -26005.4558, -17381.4046, -11054.4150, -6495.9537, -3269.6488, -1025.8698, 507.8957, 1538.6604, 2219.9131, 2662.8629, 2946.3235, 3124.8838, 3235.9159, 3304.0352, 3345.4138, 3370.4152, 3385.5565, 3394.8615, 3400.7695, 3404.7331, 3407.6021)
  
  result <- skewedGaussian_minpack.lm_objectiveFun(params=in_param, observed=EIC$rt, xx=EIC$rt)
  
  # Check results
  expect_equal(result, out_res)
})

test_that('skewedGaussian_guess()', {
  # Input / result
  guessed_param <- list(init_params  = list(amplitude=1e+07, center=3385.577, sigma=1, gamma=1),
                        lower_bounds = list(amplitude=0,     center=3382.577, sigma=0, gamma=-0.1),
                        upper_bounds = list(amplitude=1e+09, center=3388.577, sigma=5, gamma=5))
  
  result        <- skewedGaussian_guess(x=EIC$rt, y=EIC$int)
  
  # Check results
  expect_equal(result, guessed_param)
})
