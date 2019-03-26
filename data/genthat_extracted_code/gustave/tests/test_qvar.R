
context("qvar")

technical_data_ict <- list(
  samp = list(
    id = ict_sample$firm_id,
    exclude = rep(FALSE, NROW(ict_sample)),
    precalc = suppressWarnings(var_srs(
      y = NULL, pik = 1 / ict_sample$w_sample, strata = ict_sample$strata
    ))
  ),
  nrc = list(
    id = ict_sample$firm_id[ict_sample$resp & ict_sample$nrc],
    response_prob = ict_sample$response_prob_est[ict_sample$resp & ict_sample$nrc],
    sampling_weight = ict_sample$w_sample[ict_sample$resp & ict_sample$nrc]
  ),
  calib = list(
    id = ict_sample$firm_id[ict_sample$calib],
    precalc = res_cal(y = NULL, 
                     x = as.matrix(ict_sample[
                       ict_sample$calib,
                       c(paste0("N_", 58:63), paste0("turnover_", 58:63))
                       ]),
                     w = ict_sample$w_calib[ict_sample$calib],
                     id = ict_sample$firm_id
    )
  )
)


y <- matrix(ict_survey$speed_quanti, dimnames = list(ict_survey$firm_id))


test_that("qvar_variance_function works", {
  expect_error(
    with(technical_data_ict, qvar_variance_function(y, samp = samp, nrc = nrc, calib = calib)), 
    regexp = NA
  )
})

test_that("a variance wrapper can be manually defined on top of qvar_variance_function", {
  expect_error({
    variance_wrapper_ict <- define_variance_wrapper(
      variance_function = qvar_variance_function,
      reference_id = ict_survey$firm_id,
      reference_weight = ict_survey$w_calib,
      technical_data = technical_data_ict,
      default_id = "firm_id"
    )
    variance_wrapper_ict(ict_survey, speed_quanti)
  },
  regexp = NA
  )
})

test_that("Step 1.1: Arguments consistency", {
  expect_error(
    qvar(), 
    regexp = "The following arguments are missing: data, id, dissemination_dummy, dissemination_weight, sampling_weight."
  )
  expect_error(
    qvar(
      data = blabla, id = "blabla", dissemination_dummy = "blabla", dissemination_weight = "blabla",
      sampling_weight = "blabla",
      nrc_weight = "blabla"
    ), regexp = "weights after non-response"
  )
  expect_error(
    qvar(
      data = ict_sample, id = "blabla", dissemination_dummy = "blabla", dissemination_weight = "blabla", 
      sampling_weight = "blabla",
      calibration_dummy = "blabla"
    ), regexp = "a variable indicating the units taking part"
  )
  expect_error(
    qvar(
      data = ict_sample, id = "blabla", dissemination_dummy = "blabla", dissemination_weight = "blabla",
      sampling_weight = "blabla",
      calibration_weight = "blabla"
    ), regexp = "calibrated weights are provided"
  )
  expect_error(
    qvar(
      data = ict_sample, id = "blabla", dissemination_dummy = "blabla", dissemination_weight = "blabla",
      sampling_weight = "blabla",
      nrc_dummy = "blabla"
    ), regexp = "a variable indicating responding units and/or a variable"
  )
})

test_that("Step 1.2: Welcome message", {
  skip("skip")
  welcome <- "Variance wrapper definition using the dataset : blabla\n\nThe following features are taken into account:"
  expect_message(
    qvar(
      data = blabla,
      sampling_weight = "blabla"
    ), regexp = paste0(welcome, "\n  - simple random sampling WITHOUT stratification")
  )
  expect_message(
    qvar(
      data = blabla,
      sampling_weight = "blabla", strata = "blabla"
    ), regexp = tmp <- paste0(welcome, "\n  - stratified simple random sampling")
  )
  expect_message(
    qvar(
      data = blabla,
      sampling_weight = "blabla", strata = "blabla",
      scope_dummy = "blabla"
    ), regexp = tmp <- paste0(tmp, "\n  - out-of-scope units")
  )
  expect_message(
    qvar(
      data = blabla,
      sampling_weight = "blabla", strata = "blabla",
      scope_dummy = "blabla",
      nrc_weight = "blabla", resp = "blabla"
    ), regexp = tmp <- paste0(tmp, "\n  - non-response correction through reweighting")
  )
  expect_message(
    qvar(
      data = blabla,
      sampling_weight = "blabla", strata = "blabla",
      scope_dummy = "blabla",
      nrc_weight = "blabla", resp = "blabla",
      calibration_weight = "blabla", calibration_var = "blabla"
    ), regexp = paste0(tmp, "\n  - calibration on margins")
  )
})

test_that("Step 2: Control that arguments do exist and retrive their value", {
  expect_error(
    qvar(
      data = blabla, 
      id = "blabla", dissemination_dummy = "blabla", dissemination_weight = "blabla", 
      sampling_weight = "blabla",
      define = TRUE
    ), 
    regexp = "obj"
  )
  expect_error(
    qvar(
      data = matrix(1:10), 
      id = "blabla", dissemination_dummy = "blabla", dissemination_weight = "blabla",
      sampling_weight = "blabla",
      define = TRUE
    ), 
    regexp = "data argument must refer to a data.frame"
  )
  expect_error(
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample", 
      sampling_weight = "w_sample", strata = "strata",
      define = TRUE
    ),
    regexp = NA
  )
  expect_error(
    qvar(
      data = ict_sample, 
      id = "blabla", dissemination_dummy = "dissemination", dissemination_weight = "w_calib", 
      sampling_weight = c("blabla", "bloblo"),
      define = TRUE
    ),
    regexp = "The following arguments do not refer to a variable name"
  )
  expect_error(
    qvar(
      data = ict_sample, 
      id = "blabla", dissemination_dummy = "dissemination", dissemination_weight = "w_calib", 
      sampling_weight = "blabla", 
      calibration_weight = "blabla", calibration_var = 2,
      define = TRUE
    ), 
    regexp = "The following arguments do not refer to a vector of variable names"
  )
  expect_error(
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata",
      nrc_weight = "w_nrc", response_dummy = "blabla",
      define = TRUE
    ),
    regexp = "Some variables do not exist in ict_sample: \n  - response_dummy argument: blabla"
  )
})

test_that("Step 3: Control arguments value", {
  
  # id
  ict_sample$firm_id[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "contain any missing \\(NA\\) values.")
  rm(ict_sample)
  ict_sample$firm_id[1] <- ict_sample$firm_id[2]
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "contain any duplicated values.")
  rm(ict_sample)
  
  # dissemination_dummy
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "division", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "should be of type logical or numeric.")
  expect_error({
    suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    ))
  }, regexp = NA)
  ict_sample$dissemination[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "should not contain any missing \\(NA\\) values.")
  rm(ict_sample)

  # dissemination_weight
  ict_sample$w_sample <- as.character(ict_sample$w_calib)
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "should be numeric.")
  rm(ict_sample)
  ict_sample$w_sample[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "contain any missing \\(NA\\) values.")
  rm(ict_sample)
  

  # sampling_weight
  ict_sample$w_sample <- as.character(ict_sample$w_sample)
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "should be numeric.")
  rm(ict_sample)
  ict_sample$w_sample[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample",
      define = TRUE
    )
  }, regexp = "contain any missing \\(NA\\) values.")
  rm(ict_sample)

  # strata
  ict_sample$strata <- suppressWarnings(as.numeric(ict_sample$strata))
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample", strata = "strata",
      define = TRUE
    )
  }, regexp = " should be of type factor or character.")
  rm(ict_sample)
  expect_error({
    suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample", strata = "strata",
      define = TRUE
    ))
  }, regexp = NA)
  ict_sample$strata[1] <- NA
  expect_error({
    suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample", strata = "strata",
      define = TRUE
    ))
  }, regexp = "should not contain any missing \\(NA\\) values.")
  rm(ict_sample)
  
  # scope_dummy
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "division",
      define = TRUE
    )
  }, regexp = "should be of type logical or numeric.")
  expect_error({
    suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      define = TRUE
    ))
  }, regexp = NA)
  ict_sample$scope[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_sample",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      define = TRUE
    )
  }, regexp = "should not contain any missing \\(NA\\) values.")
  rm(ict_sample)
  ict_sample$scope[match(TRUE, ict_sample$resp)] <- FALSE
  expect_error({
    variance_wrapper <- qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp =  "The following units are out-of-scope")
  rm(ict_sample)
  
  # nrc_dummy
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "division",
      define = TRUE
    )
  }, regexp = "should be of type logical or numeric.")
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp = NA)
  ict_sample$nrc[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp = "should not contain any missing \\(NA\\) values.")
  rm(ict_sample)
  
  # response_dummy
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "division", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp = "should be of type logical or numeric.")
  expect_error({
    suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    ))
  }, regexp = NA)
  ict_sample$resp[1] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp = "should not contain any missing \\(NA\\) values.")
  rm(ict_sample)
  
  # nrc_weight
  ict_sample$w_nrc <- as.character(ict_sample$w_nrc)
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp = "should be numeric.")
  rm(ict_sample)
  ict_sample$w_nrc2 <- ict_sample$w_nrc
  ict_sample$w_nrc2[match(TRUE, ict_sample$resp)] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc2", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
  }, regexp = "should not contain any missing \\(NA\\) values for responding units.")
  rm(ict_sample)
  ict_sample$w_nrc[match(FALSE, ict_sample$resp)] <- NA
  expect_error({
    suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    ))
  }, regexp = NA)
  rm(ict_sample)
  
  # calibration_dummy
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_dummy = "division", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
  }, regexp = "should be of type logical or numeric.")
  ict_sample$calib <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_dummy = "calib", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
  }, regexp = "should not contain any missing \\(NA\\) values.")
  rm(ict_sample)
  
  # calibration_weight
  ict_sample$w_calib <- as.character(ict_sample$w_calib)
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_dummy = "calib", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
  }, regexp = "should be numeric.")
  rm(ict_sample)

  # calibration_var
  ict_sample$complex <- complex(real = 1:NROW(ict_sample), imaginary = 1:NROW(ict_sample))
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  "complex",
      define = TRUE
    )
  }, regexp = "The following calibration variables are neither quantitative")
  rm(ict_sample)
  ict_sample[match(TRUE, ict_sample$calib), c("N_58", "N_59")] <- NA
  expect_error({
    qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
  }, regexp = "contain missing \\(NA\\) values for units used in the calibration process:")
  rm(ict_sample)
  expect_error({
    variance_wrapper <- suppressWarnings(qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  "division",
      define = TRUE
    ))
    variance_wrapper(ict_survey, turnover)
  }, regexp = NA)

})

test_that("Step 4: Define methodological quantities", {
  
  expect_error({
    variance_wrapper <- qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_nrc",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
    
  }, regexp =  "The following units have a disseminated weight")

  ict_sample$dissemination[match(TRUE, ict_sample$resp)] <- FALSE
  ict_sample$scope[match(TRUE, ict_sample$resp)] <- FALSE
  expect_error({
    variance_wrapper <- qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      define = TRUE
    )
    
  }, regexp =  "the following units are classified both as out-of-scope units")
  rm(ict_sample)
  
  ict_sample$strata[1:26] <- letters
  expect_warning({
    variance_wrapper <- qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
    variance_wrapper(ict_survey, speed_quanti)
  }, regexp = "The following strata contain less than two sampled units.")
  rm(ict_sample)
  
  ict_sample$w_sample[1] <- ict_sample$w_sample[1] / 2
  expect_warning({
    variance_wrapper <- qvar(
      data = ict_sample, 
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("N_58", "N_59"),
      define = TRUE
    )
    variance_wrapper(ict_survey, speed_quanti)
  }, regexp = "The following strata contain units whose sampling weights")
  rm(ict_sample)
  
})

# TODO: Add more tests with out-of-scope units


test_that("qvar works", {
  expect_error(
    qvar(
      ict_sample, mean(turnover),
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("division", "turnover_58", "turnover_59"),
      define = TRUE
    ), 
    regexp = NA
  )
  expect_error({
    qvar_wrapper <- suppressWarnings(qvar(
      ict_sample,
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("division", "turnover_58", "turnover_59"),
      define = TRUE
    ))
    qvar_wrapper(ict_survey, mean(turnover))
  }, regexp = NA)
  expect_identical(
    suppressWarnings(qvar(
      ict_sample, mean(turnover),
      id = "firm_id", dissemination_dummy = "dissemination", dissemination_weight = "w_calib",
      sampling_weight = "w_sample", strata = "strata", 
      scope_dummy = "scope",
      nrc_weight = "w_nrc", response_dummy = "resp", nrc_dummy = "nrc",
      calibration_weight = "w_calib", calibration_var =  c("division", "turnover_58", "turnover_59")
    )), 
    qvar_wrapper(ict_survey, mean(turnover))
  )
})
  
