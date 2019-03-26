context("Sense checking confidence intervals")

xfive <- c(0, 8, 63, 112, 262, 295)
nfive <- c(327, 30666, 123419, 149919, 104088, 34392)
ntotal <- c(319933, 931318, 786511, 488235, 237863, 61313)

methods_list  <- list(
  gamma = list(
    list(wmtype = "max"),
    list(midp = TRUE),
    list(wmtype = "tcz"),
    list(wmtype = "mean"),
    list(wmtype = "minmaxavg")),
  asymptotic = list(
    list(trans = "none"),
    list(trans = "log"),
    list(trans = "loglog"),
    list(trans = "logit")),
  dobson = list(
    list(midp = FALSE),
    list(midp = TRUE)),
  beta = list(
    list(wmtype = "none"),
    list(wmtype = "tcz"),
    list(wmtype = "mean"),
    list(wmtype = "minmaxavg"),
    list(wmtype = "max")),
  bootstrap = list(list())
)

all_ts <- mapply(dsrTest::dsrTest,
  method = rep(names(methods_list), times = lengths(methods_list)),
  control = do.call(c, unname(methods_list)),
  MoreArgs = list(mult = 1e5, x = xfive, n = nfive, w = ntotal),
  SIMPLIFY = FALSE)

all_less <- mapply(dsrTest::dsrTest,
  method = rep(names(methods_list), times = lengths(methods_list)),
  control = do.call(c, unname(methods_list)),
  MoreArgs = list(mult = 1e5, x = xfive, n = nfive, w = ntotal,
  alternative = "less"), SIMPLIFY = FALSE)

all_greater <- mapply(dsrTest::dsrTest,
  method = rep(names(methods_list), times = lengths(methods_list)),
  control = do.call(c, unname(methods_list)),
  MoreArgs = list(mult = 1e5, x = xfive, n = nfive, w = ntotal,
  alternative = "greater"), SIMPLIFY = FALSE)

test_that("Estimate is within confidence intervals for all methods", {
  expect_true(all(
    sapply(all_less,
      function(x) findInterval(x$estimate, x$conf.int))) == 1L)
  expect_true(all(
    sapply(all_ts,
      function(x) findInterval(x$estimate, x$conf.int))) == 1L)
  expect_true(all(
    sapply(all_greater,
      function(x) findInterval(x$estimate, x$conf.int))) == 1L)
})

test_that("Confidence Intervals are ordered appropriately", {
  all(!sapply(all_less, function(x) is.unsorted(x$confint)))
  all(!sapply(all_greater, function(x) is.unsorted(x$confint)))
  all(!sapply(all_ts, function(x) is.unsorted(x$confint)))
})

context("P-values sensible for alternatives")

less_value <- mapply(dsrTest::dsrTest,
  method = rep(names(methods_list), times = lengths(methods_list)),
  control = do.call(c, unname(methods_list)),
  null.value = sapply(all_less, function(x) x$conf.int[2] + 0.5),
  MoreArgs = list(mult = 1e5, x = xfive, n = nfive, w = ntotal,
  alternative = "less"), SIMPLIFY = FALSE)

test_that("P value is sensible :: less", {
  pvals <- sapply(less_value, function(x) x$p.value < 0.05)
  message(methods_list[which(!pvals)])
  expect_true(all(pvals))
})



context("Integer overflow")

xL <- c(0L, 8L, 63L, 112L, 262L, 295L)
nL <- c(327L, 30666L, 123419L, 149919L, 104088L, 34392L)
ntL <- c(319933L, 931318L, 786511L, 488235L, 237863L, 61313L)

test_that("Integer valued data doesn't cause issues", {
  expect_equal(
    all_ts[[1]][-9L], dsrTest(xL, nL, ntL, mult = 1e5)[-9L])
})
