################################################################################
# test-TestStatisticsFunctions.R
################################################################################
# 2018-09-20
# Curtis Miller
################################################################################
# Test statistics functions for proper behavior.
################################################################################

################################################################################
# SCAFFOLDING
################################################################################

context("Statistics functions")
library(CPAT)

has_cointReg <- requireNamespace("cointReg", quietly = TRUE)

#' Check for cointReg
#'
#' Check for the cointReg package; if not present, skip the test.
#' 
#' @examples
#' check_cointReg()
check_cointReg <- function() {
  if (!has_cointReg) {
    skip("cointReg not available")
  }
}

#' Some Kernel Function
#'
#' A function to be used for testing kernel-based methods
#'
#' @param j A number to pass to the kernel function
#' @return Value of the kernel function
#' @examples
#' ker_func(0.5)
ker_func <- function(j) {
  max(1 - abs(j), 0)
}

# Dataset for testing
dat <- c(-0.64, -1.17, 0.76,  1.77, 1.77, -0.28, -0.20, 0.83, -0.08,  2.57, 
         -0.13, -1.22, 0.47, -0.32, 0.18, -1.38,  0.21, 0.38,  0.15, -0.31)

df <- data.frame(x = 1:20, y = 1 + 2 * 1:20 + dat)

################################################################################
# UNDERLYING FUNCTION TESTING
################################################################################

test_that("stat_Zn() functions properly", {
  expect_equal(CPAT:::stat_Zn(dat), 1.58902205341715)

  res <- CPAT:::stat_Zn(dat, estimate = TRUE, get_all_vals = TRUE)
  expect_equal(res$statistic,  1.58902205341715)
  expect_equal(res$estimate, 10)
  expect_equal(res$stat_vals,
               c(0.0303450116854491, 0.907107559783405, 0.584115126572313,
                 0.3722609420561530, 0.638146467227364, 0.514186903623801,
                 1.5890220534171500, 1.457098869814150, 0.845285623368565,
                 1.0378836334000500, 0.873366776528059, 0.987448725093092,
                 0.1530582795440690))

  expect_equal(CPAT:::stat_Zn(dat, use_kernel_var = TRUE, kernel = ker_func,
                              bandwidth = sqrt), 2.27610096950933)
  expect_equal(CPAT:::stat_Zn(dat, custom_var = function(x, k) {
                                var(x[1:(min(k + 1, length(x)))])
                              }), 1.25197565798885)
  expect_equal(CPAT:::stat_Zn(dat, custom_var = function(x, k) var(x)),
               1.439370888561)

  check_cointReg()

  expect_equal(CPAT:::stat_Zn(dat, use_kernel_var = TRUE), 1.58829744129333)
})

test_that("stat_Vn() functions properly", {
  expect_equal(CPAT:::stat_Vn(dat), 0.888290332296761)

  res <- CPAT:::stat_Vn(dat, estimate = TRUE, get_all_vals = TRUE)
  expect_equal(res$statistic, 0.888290332296761)
  expect_equal(res$estimate, 10)
  expect_equal(res$stat_vals, 
               c(0.1860482588333920, 0.520634431435331, 0.360310650616115,
                 0.0108565614250703, 0.380316406233684, 0.274285437237333,
                 0.1893711755857890, 0.342465331277215, 0.284564825236631,
                 0.8882903322967610, 0.806397600403535, 0.453627867421295,
                 0.5279770762213650, 0.410110571137388, 0.414000463800686,
                 0.0547597948127525, 0.064285500675461, 0.112576638143350,
                 0.1087825244876340))

  expect_equal(CPAT:::stat_Vn(dat, use_kernel_var = TRUE, kernel = ker_func,
                              bandwidth = sqrt), 1.27237912286901)
  expect_equal(CPAT:::stat_Vn(dat, custom_var = function(x, k) {
      var(x[1:(min(k + 1, length(x)))])
                              }), 0.699875669359526)
  expect_equal(CPAT:::stat_Vn(dat, custom_var = function(x, k) var(x)),
               0.804632787914169)

  check_cointReg()

  expect_equal(CPAT:::stat_Vn(dat, use_kernel_var = TRUE), 0.887885261805216)
})

test_that("stat_de() functions properly", {
  expect_equal(CPAT:::stat_de(dat), 1.58953572310406)

  res <- CPAT:::stat_de(dat, estimate = TRUE, get_all_vals = TRUE)
  expect_equal(res$statistic, 1.58953572310406)
  expect_equal(res$estimate, 10)
  expect_equal(res$stat_vals, 
               c( 0.6666030152225960,  1.54840316329497000, 0.822026714752378,
                 -0.1599035379267860,  0.69125817657553300, 0.411494952874413,
                  0.2099849222681120,  0.51200948869585500, 0.384951879021424,
                  1.5895357231040600,  1.43387522359022000, 0.738919065418096,
                  0.9198957847897980,  0.70788969448132500, 0.769048175390362,
                 -0.0501454544575806, -0.00700952891422735, 0.188210518988372,
                  0.3120835122629970))

  expect_equal(CPAT:::stat_de(dat, use_kernel_var = TRUE, kernel = ker_func,
                              bandwidth = sqrt), 2.35771330424856)
  expect_equal(CPAT:::stat_de(dat, custom_var = function(x, k) {
      var(x[1:(min(k + 1, length(x)))])
                              }), 2.02497320978937)
  expect_equal(CPAT:::stat_de(dat, custom_var = function(x, k) var(x)),
               1.42222063433888)

  check_cointReg()

  expect_equal(CPAT:::stat_de(dat, use_kernel_var = TRUE), 1.58872558212097)
})

test_that("stat_hs() functions properly", {
  expect_equal(CPAT:::stat_hs(dat), 1.21370945972696)

  res <- CPAT:::stat_hs(dat, estimate = TRUE, get_all_vals = TRUE)
  expect_equal(res$statistic, 1.21370945972696)
  expect_equal(res$estimate, 10)
  expect_equal(res$stat_vals, 
               c(-1.370582690156750,  1.07517939544294, -1.03102406018458, 
                 -2.267843009815840, -1.31990422541547, -1.81917583478302,
                 -2.068984134345630, -1.65939233959489, -1.85754100603907,
                  1.213709459726960,  0.69794177537658, -1.21847690153309,
                 -0.793814665362957, -1.28502483213330, -1.15205095731958,
                 -2.244864368803760, -2.22744398880951, -2.09014950652634,
                 -1.954438886999530))

  expect_equal(CPAT:::stat_hs(dat, use_kernel_var = TRUE, kernel = ker_func,
      bandwidth = sqrt), 3.99463145080931)
  expect_equal(CPAT:::stat_hs(dat, custom_var = function(x, k) {
                 var(x[1:(min(k + 1, length(x)))])
               }), 2.46376948017636)
  expect_equal(CPAT:::stat_hs(dat, custom_var = function(x, k) var(x)),
               0.236019124621259)
  expect_equal(CPAT:::stat_hs(dat, corr = TRUE), 1.21370945972696)

  check_cointReg()

  expect_equal(CPAT:::stat_hs(dat, use_kernel_var = TRUE), 0.78115982765937)
})

test_that("andrews_test() functions properly", {
  expect_error(CPAT:::andrews_test(dat), "argument \"M\" is missing")
  expect_equal(CPAT:::andrews_test(dat, 15),
               list(pval = 1, stat = 2.41061543748607))
  expect_equal(CPAT:::andrews_test(c(dat, c(1, 3, 2, 3, 2)), 20),
               list(pval = 0.3125, stat = 7.94772816422427))
  expect_equal(CPAT:::andrews_test(c(dat, c(1, 3, 2, 3, 2)), 20, pval = FALSE),
               7.94772816422427)
  expect_equal(CPAT:::andrews_test(c(dat, c(1, 3, 2, 3, 2)), 20, stat = FALSE),
               0.3125)
})

test_that("andrews_test_reg() functions properly", {
  expect_error(CPAT:::andrews_test_reg(dat), "Bad formula passed")
  expect_error(CPAT:::andrews_test_reg(y ~ x, data = df), "argument .* missing")
  expect_equal(CPAT:::andrews_test_reg(y ~ x, data = df, M = 15),
               list(pval = 0.545454545454545, stat = 0.578318267262971))
  expect_equal(CPAT:::andrews_test_reg(y ~ x, data = df, M = 15, pval = FALSE),
               0.578318267262971)
  expect_equal(CPAT:::andrews_test_reg(y ~ x, data = df, M = 15, stat = FALSE),
               0.545454545454545)
})

################################################################################
# LRV TEST
################################################################################

test_that("get_lrv_vec() functions properly, interfaces where it should", {
  expect_equal(CPAT:::get_lrv_vec(dat, kernel = ker_func, bandwidth = sqrt),
               c(0.581238887175265, 0.632229813007764, 0.681431014190319,
                 0.646220314031592, 0.611266882865371, 0.578769643980172,
                 0.582735929700783, 0.533450929616323, 0.522333689063721,
                 0.411455302969274, 0.382884504978510, 0.438867732426083,
                 0.456809375948772, 0.518036697090424, 0.559787452269136,
                 0.630613678319110, 0.633485003925464, 0.633403884907476,
                 0.636668741508810))

  check_cointReg()

  expect_equal(CPAT:::get_lrv_vec(dat),
               c(0.944000055543033, 0.854345524470940, 0.938887787065566,
                 0.988543921777035, 0.950674807065429, 0.966696492122214,
                 0.977280759919950, 0.962346545793554, 0.963543535868417,
                 0.844971457475420, 0.858397192435424, 0.934364474783002,
                 0.924364070223716, 0.941827034624808, 0.944039246554919,
                 0.986652076557760, 0.986822029414594, 0.981427647381865,
                 0.976271063827923))
})

################################################################################
# INTERFACE TESTS
################################################################################

test_that("CUSUM.test() functions properly", {
  expect_s3_class(CUSUM.test(dat), "htest")
  expect_equal(CUSUM.test(dat)$data.name, "dat")
  expect_equal(CUSUM.test(dat)$p.value, 0.409099915842597)
  expect_equal(CUSUM.test(dat)$estimate, c(`t*` = 10))
  expect_equal(CUSUM.test(dat)$statistic, c(A = 0.888290332296761))
  expect_equal(CUSUM.test(dat, use_kernel_var = TRUE)$p.value,
               0.409673316747916)
})

test_that("HR.test() functions properly", {
  expect_s3_class(HR.test(dat), "htest")
  expect_equal(HR.test(dat)$data.name, "dat")
  expect_equal(HR.test(dat)$p.value, 0.00194727161751529)
  expect_equal(HR.test(dat)$estimate, c(`t*` = 2))
  expect_equal(HR.test(dat)$statistic, c(D = 3.48777644674448))
  expect_equal(HR.test(dat)$parameters, c(`log(T)` = 2.99573227355399))
  expect_equal(HR.test(dat, use_kernel_var = TRUE)$p.value,
               0.00349647304622447)
})

test_that("DE.test() functions properly", {
  expect_s3_class(DE.test(dat), "htest")
  expect_equal(DE.test(dat)$data.name, "dat")
  expect_equal(DE.test(dat)$p.value, 0.335048134286715)
  expect_equal(DE.test(dat)$estimate, c(`t*` = 10))
  expect_equal(DE.test(dat)$statistic, c(A = 1.58953572310406))
  expect_equal(DE.test(dat)$parameter, c(`a(log(T))` = 1.4813431070248, 
                                         `b(log(T))` = 1.66838804851426))
  expect_equal(DE.test(dat, use_kernel_var = TRUE)$p.value,
               0.335268000418675)
})

test_that("HS.test() functions properly", {
  expect_s3_class(HS.test(dat), "htest")
  expect_equal(HS.test(dat)$data.name, "dat")
  expect_equal(HS.test(dat)$p.value, 0.663825560827292)
  expect_equal(HS.test(dat)$statistic, c(A = 1.21370945972696))
  expect_equal(HS.test(dat, corr = FALSE)$p.value, 0.81061923831157)
})

test_that("Andrews.test() functions properly", {
  expect_error(Andrews.test(dat), "argument \"M\" is missing")
  expect_s3_class(Andrews.test(dat, M = 15), "htest")
  expect_equal(Andrews.test(dat, M = 15)$data.name, "dat")
  expect_equal(Andrews.test(dat, M = 15)$p.value, 1)
  expect_equal(Andrews.test(dat, M = 15)$statistic, c(S = 2.41061543748607))
  expect_equal(Andrews.test(dat, M = 15)$parameters, c(m = 5))
  expect_equal(Andrews.test(df, 15, y ~ x)$statistic, c(S = 0.578318267262971))
})
