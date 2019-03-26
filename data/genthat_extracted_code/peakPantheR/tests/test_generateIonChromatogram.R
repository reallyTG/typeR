context('generateIonChromatogram()')

## Input and expected data
# raw data extracted from file ko15.CDf from the pkg faahKO with rt=c(3362.102, 3409.051), mz=c(496., 498.), msLevel=1
in_rt   <- c(3362.102, 3362.102, 3363.667, 3363.667, 3365.232, 3365.232, 3366.797, 3366.797, 3368.362, 3368.362, 3369.927, 3369.927, 3371.492, 3371.492, 3373.057, 3373.057, 3374.622, 3374.622, 3376.187, 3376.187, 3377.752, 3377.752, 3379.317, 3379.317, 3380.882, 3380.882, 3382.447, 3382.447, 3384.012, 3384.012, 3385.577, 3385.577, 3387.142, 3387.142, 3388.707, 3388.707, 3390.272, 3390.272, 3391.837, 3391.837, 3393.402, 3393.402, 3394.966, 3394.966, 3396.531, 3396.531, 3398.096, 3398.096, 3399.661, 3399.661, 3401.226, 3401.226, 3402.791, 3402.791, 3404.356, 3404.356, 3405.921, 3405.921, 3407.486, 3407.486, 3409.051, 3409.051)
in_mz   <- c(496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2)
in_int  <- c(39616, 11432, 63344, 18224, 107352, 30936, 182144, 51776, 295232, 81216, 438016, 119272, 592256, 160960, 737408, 200640, 858624, 233216, 938368, 258624, 982976, 278080, 1015232, 293760, 1057280, 305472, 1095680, 310912, 1122304, 309056, 1128960, 303936, 1111040, 296768, 1058816, 286528, 996608, 271872, 942272, 256320, 888640, 238208, 820160, 216384, 744448, 193152, 674688, 175104, 609600, 161856, 543552, 148864, 480896, 133632, 428032, 118056, 387520, 105232, 350976, 95488, 313984, 86648)
input_ROIDataPoints <- data.frame(rt=in_rt, mz=in_mz, int=in_int)

test_that('aggregate with sum (EIC/TIC)', {
  # Expected signal
  expected_rt       <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057, 3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577, 3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096, 3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
  expected_int      <- c(51048, 81568, 138288, 233920, 376448, 557288, 753216, 938048, 1091840, 1196992, 1261056, 1308992, 1362752, 1406592, 1431360, 1432896, 1407808, 1345344, 1268480, 1198592, 1126848, 1036544, 937600, 849792, 771456, 692416, 614528, 546088, 492752, 446464, 400632)
  expected_ionChrom <- data.frame(rt=expected_rt, int=expected_int)

  # results (output, warnings and messages)
  result_ionChromatogram  <- generateIonChromatogram(input_ROIDataPoints, aggregationFunction='sum')

  # Check results
  expect_equal(result_ionChromatogram, expected_ionChrom)
})

test_that('aggregate with min', {
  # Expected signal
  expected_rt       <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057, 3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577, 3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096, 3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
  expected_int      <- c(11432, 18224, 30936, 51776, 81216, 119272, 160960, 200640, 233216, 258624, 278080, 293760, 305472, 310912, 309056, 303936, 296768, 286528, 271872, 256320, 238208, 216384, 193152, 175104, 161856, 148864, 133632, 118056, 105232, 95488, 86648)
  expected_ionChrom <- data.frame(rt=expected_rt, int=expected_int)
  
  # results (output, warnings and messages)
  result_ionChromatogram  <- generateIonChromatogram(input_ROIDataPoints, aggregationFunction='min')
  
  # Check results
  expect_equal(result_ionChromatogram, expected_ionChrom)
})

test_that('aggregate with max', {
  # Expected signal
  expected_rt       <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057, 3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577, 3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096, 3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
  expected_int      <- c(39616, 63344, 107352, 182144, 295232, 438016, 592256, 737408, 858624, 938368, 982976, 1015232, 1057280, 1095680, 1122304, 1128960, 1111040, 1058816, 996608, 942272, 888640, 820160, 744448, 674688, 609600, 543552, 480896, 428032, 387520, 350976, 313984)
  expected_ionChrom <- data.frame(rt=expected_rt, int=expected_int)
  
  # results (output, warnings and messages)
  result_ionChromatogram  <- generateIonChromatogram(input_ROIDataPoints, aggregationFunction='max')
  
  # Check results
  expect_equal(result_ionChromatogram, expected_ionChrom)
})

test_that('aggregate with mean', {
  # Expected signal
  expected_rt       <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057, 3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577, 3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096, 3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
  expected_int      <- c(25524, 40784, 69144, 116960, 188224, 278644, 376608, 469024, 545920, 598496, 630528, 654496, 681376, 703296, 715680, 716448, 703904, 672672, 634240, 599296, 563424, 518272, 468800, 424896, 385728, 346208, 307264, 273044, 246376, 223232, 200316)
  expected_ionChrom <- data.frame(rt=expected_rt, int=expected_int)
  
  # results (output, warnings and messages)
  result_ionChromatogram  <- generateIonChromatogram(input_ROIDataPoints, aggregationFunction='mean')
  
  # Check results
  expect_equal(result_ionChromatogram, expected_ionChrom)
})

test_that('return empty df if no scans in input', {
  input_empty   <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  output_empty  <- data.frame(rt=numeric(), int=numeric())
  
  # sum
  expect_equal(generateIonChromatogram(input_empty, aggregationFunction='sum'), output_empty)
  # min
  expect_equal(generateIonChromatogram(input_empty, aggregationFunction='min'), output_empty)
  # max
  expect_equal(generateIonChromatogram(input_empty, aggregationFunction='max'), output_empty)
  # mean
  expect_equal(generateIonChromatogram(input_empty, aggregationFunction='mean'), output_empty)
})

test_that('raise errors', {
  # ROIDataPoint is not data.frame
  expect_error(generateIonChromatogram(ROIDataPoint='notADataFrame', aggregationFunction='sum'), 'Check input "ROIDataPoint" must be a data.frame', fixed=TRUE)
  # ROIDatapoint doesn't have "rt"
  expect_error(generateIonChromatogram(ROIDataPoint=data.frame(mz=c(NA), int=c(NA)), aggregationFunction='sum'), 'Check input "ROIDataPoint must have the following columns: "rt", "mz", "int"', fixed=TRUE)
  # ROIDatapoint doesn't have "mz"
  expect_error(generateIonChromatogram(ROIDataPoint=data.frame(rt=c(NA), int=c(NA)), aggregationFunction='sum'), 'Check input "ROIDataPoint must have the following columns: "rt", "mz", "int"', fixed=TRUE)
  # ROIDatapoint doesn't have "int"
  expect_error(generateIonChromatogram(ROIDataPoint=data.frame(rt=c(NA), mz=c(NA)), aggregationFunction='sum'), 'Check input "ROIDataPoint must have the following columns: "rt", "mz", "int"', fixed=TRUE)
  
  # aggregationFunction is not 'sum', 'min', 'max' or 'mean'
  expect_error(generateIonChromatogram(ROIDataPoint=data.frame(rt=c(NA), mz=c(NA), int=c(NA)), aggregationFunction='wrongFun'), 'Check input "aggregationFunction" must be one of: "sum", "mean", "min", "max"', fixed=TRUE)
  
})


