context('read')

param_names <- c("TVCL", "TVV", "IVCL", "IVV", "SIGMA_1_1_")

# Reading a so
file <- system.file("extdata", "pheno.SO.xml",  package="libsoc")
so <- so_SO_read(file)
estimates <- so$SOBlock[[1]]$Estimation$PopulationEstimates$MLE

expected <- data.frame(TVCL=0.00534888, TVV=1.42034, IVCL=0.130798, IVV=0.177443, SIGMA_1_1_=0.0188202)
attributes(expected)$columnType <- list(c("structParameter"), c("structParameter"), c("varParameter", "variance"), c("varParameter", "variance"), c("varParameter", "variance"))

expect_identical(estimates, expected)

# all_population_estimates
x <- so$all_population_estimates()
expect_identical(x, expected)

# all_standard_errors

x <- so$all_standard_errors()
expected <- data.frame(TVCL=0.000381917, TVV=0.0981986, IVCL=0.0875022, IVV=0.050662, SIGMA_1_1_=0.00390377)
attributes(x)$columnType <- NULL
expect_identical(x, expected)

# random_variable_from_variability_parameter

cols <- colnames(estimates)
x <- so$random_variable_from_variability_parameter(cols)

expected <- c(NA, NA, "ETA1", "ETA2", "EPS1")
attributes(expected)$names <- param_names
expect_identical(x, expected)

# correlation_parameters

x <- so$correlation_parameters(cols)
expected <- c(F, F, F, F, F)
attributes(expected)$names <- param_names
expect_identical(x, expected)

# variability_type

x <- so$variability_type(cols)
expected <- c("structParameter", "structParameter", "parameterVariability", "parameterVariability", "residualError")
attributes(expected)$names <- param_names
expect_identical(x, expected)