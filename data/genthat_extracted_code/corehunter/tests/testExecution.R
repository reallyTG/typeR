source("testUtils.R")

########################
context("Core sampling")
########################

test_that("arguments are checked", {
  expect_error(sampleCore(), "no default")
  expect_error(sampleCore(data = "abc"), "class 'chdata'")
  data <- testData()
  expect_error(sampleCore(data, size = -1), ">= 2")
  expect_error(sampleCore(data, size = 0), ">= 2")
  expect_error(sampleCore(data, size = 1/data$size), ">= 2")
  expect_error(sampleCore(data, size = 1), ">= 2")
  expect_error(sampleCore(data, size = 1.4), ">= 2")
  expect_error(sampleCore(data, size = data$size), "< 218")
  expect_error(sampleCore(data, size = data$size + sample(1:10, size = 1)), "< 218")
  expect_error(sampleCore(data, size = "abc"), "should be numeric")
  expect_error(sampleCore(data, obj = "abc"), "class 'chobj'")
  expect_error(sampleCore(data, obj = list(123)), "class 'chobj'")
  expect_error(sampleCore(data, obj = list(objective("SH"), objective("SH"))), "Duplicate objectives.")
  expect_error(sampleCore(data, indices = "no"), "logical")
  expect_error(sampleCore(data, verbose = "yes"), "logical")
  expect_error(sampleCore(data, time = "abc"), "numeric")
  expect_error(sampleCore(data, impr.time = "def"), "numeric")
  expect_error(sampleCore(data, time = 0), "positive")
  expect_error(sampleCore(data, impr.time = -1), "positive")
  expect_error(sampleCore(data, mode = "foo"), "one of")
})

test_that("default objectives", {
  # genotypes only
  expect_silent(core <- testSampleCore(genotypeData()))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$MR))
  # phenotypes only
  expect_silent(core <- testSampleCore(phenotypeData()))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$GD))
  # distances only
  expect_silent(core <- testSampleCore(distanceData()))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$PD))
  # full dataset
  expect_silent(core <- testSampleCore(testData()))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$MR))
  expect_false(is.null(core$EN$GD))
  expect_false(is.null(core$EN$PD))
})

test_that("result contains indices or names", {
  geno <- genotypeData(size = "small")
  obj <- objective("EE", "MR")
  core.ids <- testSampleCore(geno, obj, size = 3)
  core.ind <- testSampleCore(geno, obj, size = 3, indices = TRUE)
  expect_true(is.character(core.ids$sel))
  expect_true(is.numeric(core.ind$sel))
  expect_equal(sort(core.ids$sel), sort(rownames(geno$data)[core.ind$sel]))
})

test_that("multiple objectives", {
  expect_silent(testSampleCore(testData(), obj = list(
    objective("AN", "PD"),
    objective("EE", "CE"),
    objective("EN", "GD")
  )))
})

test_that("seed is respected", {
  geno <- genotypeData()
  cores <- lapply(1:5, function(i){
    set.seed(42)
    naturalsort(sampleCore(geno, size = 2, steps = 10)$sel)
  })
  expect_true(all(sapply(cores, function(core){all.equal(core, cores[[1]])})))
})

test_that("seed is respected (fast mode)", {
  geno <- genotypeData()
  cores <- lapply(1:5, function(i){
    set.seed(42)
    naturalsort(sampleCore(geno, size = 2, steps = 5000, mode = "fast")$sel)
  })
  expect_true(all(sapply(cores, function(core){all.equal(core, cores[[1]])})))
})

test_that("seed is respected (multi-objective, with normalization)", {
  geno <- genotypeData()
  obj <- list(
    objective("EN", "MR"),
    objective("AN", "CE")
  )
  cores <- lapply(1:5, function(i){
    set.seed(42)
    naturalsort(sampleCore(geno, obj, size = 2, steps = 10)$sel)
  })
  expect_true(all(sapply(cores, function(core){all.equal(core, cores[[1]])})))
})

test_that("seed is respected (multi-objective, no normalization)", {
  geno <- genotypeData()
  obj <- list(
    objective("EN", "MR"),
    objective("AN", "CE")
  )
  cores <- lapply(1:5, function(i){
    set.seed(42)
    naturalsort(sampleCore(geno, obj, size = 2, steps = 10, normalize = FALSE)$sel)
  })
  expect_true(all(sapply(cores, function(core){all.equal(core, cores[[1]])})))
})

test_that("fixed ids are respected", {

  geno <- genotypeData(size = "small")

  # 1: fix all core items

  # on index
  always <- 1:3
  core <- sampleCore(geno, size = 3, time = 1, always.selected = always)
  expect_equal(core$sel, c("Alice", "Bob", "Dave"))
  # on id
  always <- c("Alice", "Dave", "Bob")
  core <- sampleCore(geno, size = 3, time = 1, always.selected = always)
  expect_equal(core$sel, c("Alice", "Bob", "Dave"))

  # 2: again by excluding others

  # on index
  never <- 4:5
  core <- sampleCore(geno, size = 3, time = 1, never.selected = never)
  expect_equal(core$sel, c("Alice", "Bob", "Dave"))
  # on id
  never <- c("Bob'", "Carol")
  core <- sampleCore(geno, size = 3, time = 1, never.selected = never)
  expect_equal(core$sel, c("Alice", "Bob", "Dave"))

  # 3: fix some
  always <- c(2,5)
  core <- sampleCore(geno, size = 3, time = 1, always.selected = always)
  expect_true("Dave" %in% core$sel)
  expect_true("Carol" %in% core$sel)
  ### again with A-NE objective
  core <- sampleCore(geno, obj = objective("AN"), size = 3, time = 1, always.selected = always)
  expect_true("Dave" %in% core$sel)
  expect_true("Carol" %in% core$sel)

  # 4: exclude some
  never <- c(2,5)
  core <- sampleCore(geno, size = 3, time = 1, never.selected = never)
  expect_false("Dave" %in% core$sel)
  expect_false("Carol" %in% core$sel)

  # 5: fix and exclude one
  always <- 1
  never <- 2
  core <- sampleCore(geno, size = 3, time = 1, always.selected = always, never.selected = never)
  expect_true("Alice" %in% core$sel)
  expect_false("Dave" %in% core$sel)

  # 6: multi-objective with normalization
  obj <- list(
    objective("EN", "MR"),
    objective("AN", "MR")
  )
  always <- c(2,5)
  core <- sampleCore(geno, obj = obj, size = 3, time = 1, always.selected = always)
  expect_true("Dave" %in% core$sel)
  expect_true("Carol" %in% core$sel)

  # 7: fast mode
  always <- c(2,5)
  core <- sampleCore(geno, size = 3, time = 1, always.selected = always, mode = "f")
  expect_true("Dave" %in% core$sel)
  expect_true("Carol" %in% core$sel)

})

test_that("core has expected class and elements", {
  data <- testData()
  # distances only
  core <- testSampleCore(data$dist)
  expect_is(core, "chcore")
  expect_false(is.null(core$sel))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$PD))
  expect_equal(core$EN$PD, evaluateCore(core, data$dist, objective("EN", "PD")))
  # genotypes only
  core <- testSampleCore(data$geno)
  expect_is(core, "chcore")
  expect_false(is.null(core$sel))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$MR))
  expect_equal(core$EN$MR, evaluateCore(core, data$geno, objective("EN", "MR")))
  # phenotypes only
  core <- testSampleCore(data$pheno)
  expect_false(is.null(core$sel))
  expect_false(is.null(core$EN))
  expect_false(is.null(core$EN$GD))
  expect_equal(core$EN$GD, evaluateCore(core, data$pheno, objective("EN", "GD")))
  # combined
  core <- testSampleCore(data, list(
    objective("EE", "PD"),
    objective("SH"),
    objective("AN", "GD")
  ))
  expect_is(core, "chcore")
  expect_false(is.null(core$sel))
  expect_false(is.null(core$EE))
  expect_false(is.null(core$EE$PD))
  expect_false(is.null(core$SH))
  expect_false(is.null(core$AN))
  expect_false(is.null(core$AN$GD))
  expect_equal(core$EE$PD, evaluateCore(core, data, objective("EE", "PD")))
  expect_equal(core$SH, evaluateCore(core, data, objective("SH")))
  expect_equal(core$AN$GD, evaluateCore(core, data, objective("AN", "GD")))
})

#####################
context("Objectives")
#####################

test_that("class is correct", {
  obj <- objective()
  expect_is(obj, "chobj")
})

test_that("weight is positive", {
  expect_error(objective("AN", "CE", weight = -1), "positive")
})

test_that("elements are correct", {
  o <- objective("EE", "PD")
  expect_equal(o$type, "EE")
  expect_equal(o$meas, "PD")
  expect_equal(o$weight, 1)
  o <- objective("SH", weight = 1.5)
  expect_equal(o$type, "SH")
  expect_null(o$meas)
  expect_equal(o$weight, 1.5)
})

test_that("print", {
  o <- objective()
  expect_output(print(o), "Core Hunter objective: EN \\(measure = MR, weight = 1.00, range = N/A\\)")
  o <- objective("SH")
  expect_output(print(o), "Core Hunter objective: SH \\(weight = 1.00, range = N/A\\)")
  o <- objective(range = c(0.150, 0.320))
  expect_output(
    print(o), "Core Hunter objective: EN \\(measure = MR, weight = 1.00, range = \\[0.150000, 0.320000\\]\\)"
  )
})







