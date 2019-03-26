## ----setup, include=FALSE------------------------------------------------
use_cached_data = TRUE
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(kdtools)
library(ggplot2)
library(tidytext)
library(printr)
library(scales)
theme_set(theme_classic())
bench_ntuples = 1e7
bench_ntrials = 21

## ----echo=FALSE, fig.width=6, fig.height=6-------------------------------
nr = 5e3
x = matrix(runif(nr), nc = 2)
y = kd_sort(matrix_to_tuples(x))
z = as.data.frame(tuples_to_matrix(y))
z$i = 1:nrow(z)
names(z) = c("x", "y", "i")
ggplot(z, aes(x, y)) +
  geom_path(color = "darkgrey") +
  geom_point(size = 0.25) + 
  geom_point(aes(color = i), alpha = 0.15, size = 5) +
  scale_color_gradientn(colors = rainbow(100, s = 0.8, v = 0.8)) +
  guides(color = FALSE) +
  coord_fixed()

## ----include=FALSE-------------------------------------------------------
cache_file = "../inst/extdata/sort_benchmark_data"
if (!file.exists(cache_file))
  cache_file = system.file("extdata/sort_benchmark_data", package = "kdtools")
if (use_cached_data && file.exists(cache_file)) {
  load(cache_file)
} else {
  reps = bench_ntrials
  ndim = seq(1, 9, 2)
  ntuples = round(seq(100, bench_ntuples, length.out = 5))
  what = factor(c("kd_sort", "kd_sort_threaded", "lex_sort"))
  res = expand.grid(ndim = ndim, ntuples = ntuples, what = what, time = 0)
  for (i in 1:nrow(res))
  {
    times = numeric(reps)
    for (j in seq_len(reps))
    {
      x = matrix(runif(prod(res[i, 1:2])), ncol = res[i, "ndim"])
      y = matrix_to_tuples(x)
      switch(as.character(res[i, "what"]),
             kd_sort = 
             {
                start_timing()
                kd_sort(y, inplace = TRUE, parallel = FALSE)
                end_timing()
             },
             kd_sort_threaded =
             {
                start_timing()
                kd_sort(y, inplace = TRUE, parallel = TRUE)
                end_timing()
             },
             lex_sort =
             {
               start_timing()
               lex_sort(y, inplace = TRUE)
               end_timing()
             })
      times[j] = get_timing()
    }
    res[i, "time"] = median(times)
  }
  save(res, file = cache_file)
}

## ----echo=FALSE, fig.width=7---------------------------------------------
ggplot(res) +
  geom_line(aes(x = ntuples, y = time, color = as.factor(ndim))) +
  scale_x_continuous("Number of Tuples",
      labels = trans_format("identity", scientific_format(digits = 1))) +
  facet_wrap(~what) + 
  theme(strip.background = element_blank(),
        legend.position = "bottom") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(color = "Number of dimensions",
       x = "Number of tuples",
       y = "Time (seconds)")

## ------------------------------------------------------------------------
j = cbind(sample(1:9))
k = cbind(sample(1:9))
t(kd_sort(j))
t(kd_sort(cbind(j, k)))
t(kd_sort(cbind(0, j, k)))
t(kd_sort(cbind(j, k, 0)))
t(kd_sort(cbind(0, j, 0)))

## ----fig.width=5, fig.height=5, echo=FALSE-------------------------------
xy = matrix(runif(1e3), nc = 2)
p = c(0.33, 0.33, 0.66, 0.66)
xy = kd_sort(xy)
lb = kd_lower_bound(xy, p[1:2])
ub = kd_upper_bound(xy, p[3:4])
rq = kd_range_query(xy, p[1:2], p[3:4])
rq = kd_sort(rq)
i1 = 1:nrow(xy) >= lb
i2 = 1:nrow(xy) < ub
i3 = i1 & i2
i4 = sapply(1:nrow(xy), function(i) kd_binary_search(rq, xy[i, ]))
df = rbind(data.frame(x = xy[, 1], y = xy[, 2], i = i1, j = ">= lower bound"),
           data.frame(x = xy[, 1], y = xy[, 2], i = i2, j = "< upper bound"),
           data.frame(x = xy[, 1], y = xy[, 2], i = i3, j = ">= lower b. and < upper b."),
           data.frame(x = xy[, 1], y = xy[, 2], i = i4, j = "within(lower, upper)"))
ggplot(df, aes(x, y)) +
  geom_path(color = "darkgrey") +
  geom_point(size = 0.25) + 
  geom_point(aes(color = i), alpha = 0.15, size = 3) +
  scale_color_manual(values = c("steelblue", "aquamarine")) +
  scale_x_continuous(breaks = c(0.33, 0.66)) +
  scale_y_continuous(breaks = c(0.33, 0.66)) +
  geom_vline(xintercept = p[1], color = "red") + 
  geom_hline(yintercept = p[2], color = "red") +
  geom_vline(xintercept = p[3], color = "red") +
  geom_hline(yintercept = p[4], color = "red") +
  guides(color = FALSE) +
  coord_fixed() +
  facet_wrap(~j) + 
  theme(strip.background = element_blank())

## ---- echo=FALSE---------------------------------------------------------
cache_file = "../inst/extdata/query_benchmark_data"
if (!file.exists(cache_file))
  cache_file = system.file("extdata/query_benchmark_data", package = "kdtools")
if (use_cached_data && file.exists(cache_file)) {
  load(cache_file)
} else {
  build = as.data.frame(time_build(bench_ntuples, bench_ntrials))
  query = as.data.frame(time_query(bench_ntuples, bench_ntrials))
  build$Time = signif(build$Time, 3)
  query$Time = signif(query$Time, 3)
  build$Ratio = signif(build$Time / build$Time[1], 2)
  query$Ratio = signif(query$Time / query$Time[1], 2)
  save(build, query, file = cache_file)
}
build
query

## ---- echo=FALSE---------------------------------------------------------
cache_file = "../inst/extdata/nn_benchmark_data"
if (!file.exists(cache_file))
  cache_file = system.file("extdata/nn_benchmark_data", package = "kdtools")
if (use_cached_data && file.exists(cache_file)) {
  load(cache_file)
} else {
  res = as.data.frame(time_nn(bench_ntuples, bench_ntrials))
  res$Time = signif(res$Time, 3)
  res1 = res[1:3,]
  res2 = res[4:6,]
  rownames(res2) = NULL
  res1$Ratio = signif(res1$Time / res1$Time[1], 2)
  res2$Ratio = signif(res2$Time / res2$Time[1], 2)
  save(res1, res2, file = cache_file)
}
res1
res2

## ----include=FALSE-------------------------------------------------------
header_code = '
#include <Rcpp.h>
using Rcpp::CharacterVector;
using Rcpp::NumericVector;
using Rcpp::Rcout;
using Rcpp::stop;

#include <chrono>

#include <utility>
using std::begin;
using std::end;

#include <tuple>
using std::tuple;

#include <vector>
using std::vector;

#include <string>
using std::string;

#include <kdtools.h>
using kdtools::kd_sort;
using kdtools::kd_range_query;
using kdtools::kd_nearest_neighbors;

using key_type = tuple<double, string>;
using range_type = vector<key_type>;

void print_range(const range_type& x)
{
  auto n = x.size();
  if (n < 10) stop("Not enough rows");
  for (int i = 0; i != 5; ++i)
    Rcout << i << " "
          << std::get<0>(x[i]) << " " 
          << std::get<1>(x[i]) << std::endl;
  Rcout << "..." << std::endl;
  for (int i = n - 5; i != n; ++i)
    Rcout << i << " "
          << std::get<0>(x[i]) << " " 
          << std::get<1>(x[i]) << std::endl;
}

template <typename T>
std::chrono::duration<double> time_it(T x)
{
  auto start = std::chrono::high_resolution_clock::now();
  x();
  auto finish = std::chrono::high_resolution_clock::now();
  return finish - start;
}

struct make_key
{
  key_type operator()(const double a, const char* b){ return key_type(a, b); }
};

template<class InputIt1, class InputIt2>
double set_similarity(InputIt1 first1, InputIt1 last1,
                      InputIt2 first2, InputIt2 last2)
{
  double num = 0, denom = 0;
  while (first1 != last1 && first2 != last2) {
    if (*first1 < *first2) {
      ++first1; ++denom;
    } else {
      if (!(*first2 < *first1)) {
        ++first1; ++num;
      }
      ++first2; ++denom;
    }
  }
  denom += std::distance(first1, last1) + std::distance(first2, last2);
  return num / denom;
}

namespace kdtools {

template <>
double scalar_diff(const std::string& lhs, const std::string& rhs)
{
  std::string a(lhs), b(rhs);
  std::sort(begin(a), end(a));
  std::sort(begin(b), end(b));
  return 1 - set_similarity(begin(a), end(a),
                            begin(b), end(b));
}

}; // namespace kdtools
'

header_file = "mixed_query.h"
cat(header_code, file = file.path(tempdir(), header_file))
pkg_cppflags = Sys.getenv("PKG_CPPFLAGS")
pkg_cppflags = paste(pkg_cppflags, paste0("-I\"", tempdir(), "\""))
Sys.setenv(PKG_CPPFLAGS = pkg_cppflags)

## ------------------------------------------------------------------------
data("parts_of_speech")
numbers = runif(nrow(parts_of_speech))
strings = sample(tolower(parts_of_speech[[1]]))
mixed_query(signif(numbers, 4), strings)

