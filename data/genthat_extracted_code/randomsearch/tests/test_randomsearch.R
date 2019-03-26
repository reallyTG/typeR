context("randomsearch")

test_that("simple randomsearch works without init design", {
  for (tn in names(testfs)) {
    res = randomsearch(fun = testfs[[tn]], max.evals = 10)
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf, nrow = 10)
    expect_output(print(res), "Randomsearch Result:")
  }
})

test_that("simple randomsearch works with init design", {
  for (tn in names(testfs)) {
    res = randomsearch(fun = testfs[[tn]], max.evals = 10, design = testds[[tn]])
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf, nrow = 10)
    expect_output(print(res), "Randomsearch Result:")
  }
})

test_that("simple randomsearch works with init design with y values", {
  for (tn in names(testfs)) {
    res = randomsearch(fun = testfs[[tn]], max.evals = 10, design = testdsy[[tn]])
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf, nrow = 10)
    expect_output(print(res), "Randomsearch Result:")
  }
})

test_that("simple randomsearch works with max.execbudget", {
  for (tn in names(testfs)) {
    res = randomsearch(fun = testfs[[tn]], max.evals = 10000, max.execbudget = 1)
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf)
    expect_output(print(res), "Randomsearch Result:")
  }
})

test_that("simple randomsearch works with target.fun.value", {
  for (tn in names(testfs)) {
    fun = testfs[[tn]]
    target.fun.value = fun(sampleValue(getParamSet(fun)))
    res = randomsearch(fun = fun, max.evals = 10000, target.fun.value = target.fun.value)
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf)
    expect_output(print(res), "Randomsearch Result:")
  }
})

test_that("parallel randomsearch works with max.execbudget", {
  skip_on_os(os = "windows")
  for (tn in names(testfs)) {
    res = randomsearch(fun = testfs[[tn]], max.evals = 10000, max.execbudget = 1, par.jobs = 2)
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf)
    expect_output(print(res), "Randomsearch Result:")
  }
})

test_that("parallel randomsearch works with target.fun.value", {
  for (tn in names(testfs)) {
    fun = testfs[[tn]]
    target.fun.value = fun(sampleValue(getParamSet(fun)))
    res = randomsearch(fun = fun, max.evals = 10000, target.fun.value = target.fun.value, par.jobs = 2, max.execbudget = 2)
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf)
  }
})

test_that("parallel randomsearch works with parallelMap", {
  skip_on_os(os = "windows")
  for (tn in names(testfs)) {
    fun = testfs[[tn]]
    target.fun.value = fun(sampleValue(getParamSet(fun)))
    parallelMap::parallelStartMulticore(2)
    res = randomsearch(fun = fun, max.evals = 10000, max.execbudget = 4, target.fun.value = target.fun.value)
    parallelMap::parallelStop()
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf)
  }
})

test_that("randomsearch works with normal functions", {
  for (set in testfs_nosmoof) {
    res = randomsearch(set$fun, lower = set$lower, upper = set$upper, minimize = set$minimize, max.evals = 10)
    expect_class(res, c("OptPath", "RandomsearchResult"))
    opdf = as.data.frame(res)
    expect_data_frame(opdf, nrow = 10)
    expect_output(print(res), "Randomsearch Result:")
  }
})
