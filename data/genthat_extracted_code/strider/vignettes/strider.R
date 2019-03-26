## ----include=FALSE-------------------------------------------------------
header_code = '
#include <Rcpp.h>
using Rcpp::stop;
using Rcpp::IntegerVector;
using Rcpp::NumericVector;
using Rcpp::NumericMatrix;
using Rcpp::Dimension;
using Rcpp::Rcout;
using Rcpp::Fast;
using Rcpp::wrap;

#include <strider.h>
using strider::make_strided_range;
using strider::make_strided;

#include <algorithm>
using std::accumulate;
using std::transform;
using std::for_each;
using std::begin;
using std::plus;
using std::end;

#include <vector>
using std::vector;
'

header_file = "vignette.h"
cat(header_code, file = file.path(tempdir(), header_file))
pkg_cppflags = Sys.getenv("PKG_CPPFLAGS")
pkg_cppflags = paste(pkg_cppflags, paste0("-I\"", tempdir(), "\""))
Sys.setenv(PKG_CPPFLAGS = pkg_cppflags, MAKE = "make -j2")

## ---- include=FALSE------------------------------------------------------
a = 1:100
b = 1:100
if (!identical(convolve_cpp(a, b), stl_algo_convolve(a, b)))
  stop("stl_algo_convolve is incorrect")

## ---- include=FALSE------------------------------------------------------
a = 1:100
b = 1:100
if (!identical(convolve_cpp(a, b), range_loop_convolve(a, b)))
  stop("range_loop_convolve is incorrect")

## ----echo=FALSE, warning=FALSE, message=FALSE----------------------------
if (require(microbenchmark) && require(dplyr))
{
  a = rnorm(5e3)
  b = rnorm(5e3)
  microbenchmark(convolve_cpp(a, b),
                 stl_algo_convolve(a, b),
                 range_loop_convolve(a, b)) %>%
    summary(unit = "eps") %>% select(expr, median) %>%
    mutate(relative = median / max(median)) %>% arrange(1 / median) %>%
    knitr::kable(digits = 1, caption = "Evaluations per second")
} else {
  cat("Error: either dplyr or microbenchmark is not available")
}

## ----include=FALSE-------------------------------------------------------
local({
x = matrix(1:1e4, 1e2)
if (!identical(indx_col_sum(x), colSums(x)))
  stop("indx_col_sum is incorrect")
if (!identical(strided_col_sum(x), colSums(x)))
  stop("strided_col_sum is incorrect")
if (!identical(range_col_sum(x), colSums(x)))
  stop("range_col_sum is incorrect")
})

## ----echo=FALSE, warning=FALSE, message=FALSE----------------------------
if (require(microbenchmark) && require(dplyr))
{
  x = matrix(rnorm(1e6), 1e3)
  microbenchmark(colSums(x), indx_col_sum(x),
                 strided_col_sum(x), range_col_sum(x)) %>%
    summary(unit = "eps") %>% select(expr, median) %>%
    mutate(relative = median / max(median)) %>% arrange(1 / median) %>%
    knitr::kable(digits = 1, caption = "Evaluations per second")
} else {
  cat("Error: either dplyr or microbenchmark is not available")
}

## ----include=FALSE-------------------------------------------------------
local({
x = matrix(1:1e4, 1e2)
if (!identical(indx_row_sum(x), rowSums(x)))
  stop("indx_row_sum is incorrect")
if (!identical(strided_row_sum(x), rowSums(x)))
  stop("strided_row_sum is incorrect")
if (!identical(strided_row_sum2(x), rowSums(x)))
  stop("strided_row_sum2 is incorrect")
if (!identical(range_row_sum(x), rowSums(x)))
  stop("range_row_sum is incorrect")
})

## ----echo=FALSE, warning=FALSE, message=FALSE----------------------------
if (require(microbenchmark) && require(dplyr))
{
  x = matrix(rnorm(1e6), 1e3)
  microbenchmark(strided_row_sum(x), rowSums(x),
                 indx_row_sum(x), strided_row_sum2(x),
                 range_row_sum(x)) %>%
    summary(unit = "eps") %>% select(expr, median) %>%
    mutate(relative = median / max(median)) %>% arrange(1 / median) %>%
    knitr::kable(digits = 1, caption = "Evaluations per second")
} else {
  cat("Error: either dplyr or microbenchmark is not available")
}

## ----include=FALSE-------------------------------------------------------
local({
a = matrix(c(1, 2, 1,
             1, 1, 1), 2, 3, byrow = TRUE)
b = matrix(c(0, 0, 0,
             0, 0, 0,
             0, 1, 0,
             0, 0, 0), 4, 3, byrow = TRUE)
if (!identical(convolve2_cpp(a, b), range_loop_convolve2(a, b)) ||
    !identical(convolve2_cpp(a, b), stl_algo_convolve2(a, b)) ||
    !identical(t(convolve2_cpp(a, b)), convolve2_cpp(t(a), t(b))) ||
    !identical(t(range_loop_convolve2(a, b)), range_loop_convolve2(t(a), t(b))) ||
    !identical(t(stl_algo_convolve2(a, b)), stl_algo_convolve2(t(a), t(b))))
    stop("Problem with 2D convolve")
})

## ------------------------------------------------------------------------
a = matrix(c(1, 2, 3,
             4, 5, 6), 2, 3, byrow = TRUE)
b = matrix(c(0, 0, 0,
             0, 0, 0,
             0, 1, 0,
             0, 0, 0), 4, 3, byrow = TRUE)
stl_algo_convolve2(a, b)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
if (require(microbenchmark) && require(dplyr))
{
  a = matrix(rnorm(2500), 50)
  b = matrix(rnorm(2500), 50)
  microbenchmark(convolve2_cpp(a, b),
                 stl_algo_convolve2(a, b),
                 range_loop_convolve2(a, b)) %>%
    summary(unit = "eps") %>% select(expr, median) %>%
    mutate(relative = median / max(median)) %>% arrange(1 / median) %>%
    knitr::kable(digits = 1, caption = "Evaluations per second")
} else {
  cat("Error: either dplyr or microbenchmark is not available")
}

