################################################################################
# test-ProbabilityFunctions.R
################################################################################
# 2018-09-23
# Curtis Miller
################################################################################
# testthat tests for probability functions proper behavior.
################################################################################

################################################################################
# SCAFFOLDING
################################################################################

context("Probability functions")
library(CPAT)

has_parallel <- requireNamespace("foreach", quietly = TRUE) &
                requireNamespace("doParallel", quietly = TRUE)

#' Check for Parallelization Packages
#'
#' Check for the foreach and doParallel packages; if not present, skip the test.
#'
#' @examples
#' check_parallel()
check_parallel <- function() {
  if (!has_parallel) {
    skip("foreach or doParallel not available")
  }
}

################################################################################
# BASIC PROBABILITY FUNCTIONS
################################################################################

test_that("Zn family of probability functions work", {
  expect_equal(CPAT:::dZn(seq(0, 1, length.out = 5)), c(0,
                                                       3.66446890761526e-15,
                                                       0.00331028391704399,
                                                       0.235981193466446,
                                                       0.678322811360897))
  expect_equal(CPAT:::dZn(-1), 0)
  expect_equal(CPAT:::pZn(seq(0, 1, length.out = 5)), c(0,
                                                        1.16027602231288e-17,
                                                        8.38504711667728e-05,
                                                        0.0201739742171177,
                                                        0.137475902448741))
  expect_equal(CPAT:::pZn(-1), 0)
  expect_equal(CPAT:::qZn(1), Inf)
  expect_equal(CPAT:::qZn(0), 0)
  expect_equal(CPAT:::qZn(-1), NaN)
  expect_equal(CPAT:::qZn(seq(0, 1, by = 0.2)), c(0,
                                                  1.08591602521034,
                                                  1.32902680888353,
                                                  1.58615736751008,
                                                  1.93666414996252,
                                                  Inf))
})

test_that("kolmogorov family of probability functions work", {
  expect_equal(CPAT:::pkolmogorov(seq(0, 1, length.out = 5)),
               c(0, 2.68238100848299e-08, 0.0360547563351249, 0.372832958223738,
                 0.730000328322645))
  expect_equal(CPAT:::pkolmogorov(-1), 0)
  expect_equal(CPAT:::qkolmogorov(1), Inf)
  expect_equal(CPAT:::qkolmogorov(0), 0)
  expect_equal(CPAT:::qkolmogorov(-1), NaN)
  expect_equal(CPAT:::qkolmogorov(seq(0, 1, by = 0.2)), c(0,
                                                          0.644812606166357,
                                                          0.766185555561768,
                                                          0.89476445498512,
                                                          1.07274917493965,
                                                          Inf))
})

test_that("darling_erdos family of probability functions work", {
  expect_equal(CPAT:::pdarling_erdos(seq(0, 1, length.out = 5)),
               c(0.135335283236613, 0.210640673554341, 0.297285798185269,
                 0.38878332119305, 0.479141708788015))
  expect_equal(CPAT:::qdarling_erdos(1), Inf)
  expect_equal(CPAT:::qdarling_erdos(0), -Inf)
  expect_warning(expect_equal(CPAT:::qdarling_erdos(c(-1, 2)), c(NaN, NaN)))
  expect_equal(CPAT:::qdarling_erdos(seq(0, 1, by = 0.2)), c(-Inf,
                                                             0.217262185232835,
                                                             0.780568752350701,
                                                             1.36487417265207,
                                                             2.19308716731946,
                                                             Inf))
})

test_that("hidalgo_seo family of probability functions work", {
  expect_equal(CPAT:::phidalgo_seo(seq(0, 1, length.out = 5)),
               c(0.135335283236613, 0.171187846961405, 0.210640673554341,
                 0.252946175592427, 0.297285798185269))
  expect_equal(CPAT:::qhidalgo_seo(1), Inf)
  expect_equal(CPAT:::qhidalgo_seo(0), -Inf)
  expect_warning(expect_equal(CPAT:::qhidalgo_seo(c(-1, 2)), c(NaN, NaN)))
  expect_equal(CPAT:::qhidalgo_seo(seq(0, 1, by = 0.2)), c(-Inf,
                                                           0.434524370465669,
                                                           1.5611375047014,
                                                           2.72974834530413,
                                                           4.38617433463892,
                                                           Inf))
})

################################################################################
# SIMULATION FUNCTIONS
################################################################################

test_that("Simulation functions work", {
  check_parallel()

  # Seed for testing
  set.seed(20180924)
  if (has_parallel) {
    library(doParallel)
    library(doRNG)

    registerDoParallel(1)
    registerDoRNG(20180924)
  }

  expect_equal(CPAT:::sim_Zn(5, kn = sqrt, gen_func = rexp),
               c(2.6981314379783, 0.772622685095958, 2.1563847758165,
                 1.41804730176061, 2.43116688985432))
  expect_equal(CPAT:::sim_Vn(5, gen_func = rexp), c(0.499170431042682,
                                                    1.04403869392063,
                                                    0.927274354357238,
                                                    0.678247700885792, 
                                                    0.500148950576251))
  expect_equal(CPAT:::sim_Vn_stat(5, kn = function(n) {floor(0.1 * n)},
               tau = 1/3, use_kernel_var = TRUE, gen_func = CPAT:::rchangepoint, 
               args = list(changepoint = 250, mean2 = 1)), c(8.88631874182875,
                                                             8.57621615408599,
                                                             9.36966953777968,
                                                             9.00622340555299,
                                                             9.23934329755456))
  expect_equal(CPAT:::sim_Zn_stat(5, kn = sqrt, use_kernel_var = TRUE,
               gen_func = CPAT:::rchangepoint, args = list(changepoint = 250,
                                                           mean2 = 1)),
               c(4.83580979058053, 4.25069707624916, 5.43730987094663,
                 5.1031300081116, 4.52958399617572))
  expect_equal(CPAT:::sim_de_stat(5, use_kernel_var = TRUE,
                                  gen_func = CPAT:::rchangepoint,
                                  args = list(changepoint = 250, mean2 = 1)),
               c(12.1043364689335, 9.19149382539082, 8.0625203122811,
                 8.99854428938811, 11.5682412119329))
  expect_equal(CPAT:::sim_hs_stat(5, use_kernel_var = TRUE,
                                  gen_func = CPAT:::rchangepoint,
                                  args = list(changepoint = 250, mean2 = 1)),
               c(19.7656867763002, 16.2174896544597, 17.9082420337691,
                 18.5499540996301, 15.5062244498031))
})

################################################################################
# DATASET GENERATOR
################################################################################

test_that("rchangepoint() works", {
  # Seed for testing
  set.seed(20180924)
  if (has_parallel) {
    library(doParallel)
    library(doRNG)

    registerDoParallel(1)
    registerDoRNG(20180924)
  }

  expect_equal(CPAT:::rchangepoint(5, changepoint = 2, dist = rexp,
                                   meanparam = "rate", mean1 = 1, mean2 = 2),
               c(0.387637372770394, 0.0872441101192247, 0.896044575711052,
                 0.196263917488977, 0.370863151056179))
})

