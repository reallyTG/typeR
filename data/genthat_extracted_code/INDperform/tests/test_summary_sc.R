context("test summary_sc")


scores_ex <- scoring(model_trend_ex, all_results_ex,
  press_type = INDperform::press_type_ex)
dat <- summary_sc(scores_ex)
out1 <- dat[[1]]
out2 <- dat[[2]]
out3 <- dat[[3]]
# prop.variables in list 1 and 2
prop_list1 <- grep("in%", names(out1))
prop_list2 <- grep("in%", names(out2))

nr_press_list2 <- dplyr::count(out2, ind)
comp <- merge(out1[out1$nr_sign_press > 0, c("ind",
  "nr_sign_press")], nr_press_list2, all = TRUE)

is_numeric <- function(x) {
  n <- ncol(x)
  a <- vector(length = n)
  for (i in 1:n) a[i] <- is.numeric(x[, i])
  b <- sum(a) == n
  return(b)
}


test_that("test structure of returned list", {
  expect_identical(class(dat), "list")
  expect_identical(class(out1), "data.frame")
  expect_identical(class(out3), "data.frame")
  expect_identical(out1$ind, unique(scores_ex$ind))
  expect_identical(rownames(out3), unique(scores_ex$ind))
  expect_equal(comp$nr_sign_press, comp$n)
})


test_that("test content of sublist 1", {
  expect_true(is_numeric(out1[, -1]))
  expect_false(is.na(sum(out1[, -1])))
  expect_gte(min(out1[, prop_list1]), 0)
  expect_lte(max(out1[, prop_list1]), 100)
})


test_that("test content of sublist 2", {
  expect_true(is_numeric(out2[, 4:13]))
  expect_false(is.na(sum(out2[, -c(1:3)])))
  expect_gte(min(out2[, prop_list2]), 0)
  expect_lte(max(out2[, prop_list2]), 100)
})

test_that("test content of sublist 3", {
  expect_true(is_numeric(out3))
  expect_gte(min(out3), 0)
  expect_gte(max(out3), 6)
})

test_that("error messages", {
  expect_error(summary_sc(), "Argument scores_tbl is missing")
  expect_error(summary_sc(scores_tbl = as.data.frame(scores_ex)),
    "The input object scores_tbl")
  expect_error(summary_sc(scores_tbl = scores_ex[,
    -1]), "The following variables required")
})
