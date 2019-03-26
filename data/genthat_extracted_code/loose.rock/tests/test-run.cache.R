context("run.cache")

cache0 <- file.path(tempdir(), 'run-cache')
cache1 <- file.path(tempdir(),'run-cache-changed1')
cache2 <- file.path(tempdir(), 'run-cache-changed2')

test_that('digest cache is consistent', {
  word <- '1234567'
  expect_equal(digest.cache(word), digest::digest(word, algo = 'sha256'))
  # taken manually at 2018.04.27
  expect_equal(digest.cache(word), '300a4687518d6e58377f814df9eb8a40f5befd3634de48c0fe893e47e127dbb3')
})

test_that('tempdir is correct', {
  expect_equal(tempdir.cache(), file.path('.', 'run-cache'))
})

test_that("run.cache fails with arguments", {
  expect_error(run.cache(1, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = T, show.message = TRUE))
})

test_that("run.cache base.dir in folder that does not have access", {
  if (.Platform$OS.type == 'windows') {
    # CRAN automated tests allow to write in c:/Windows
    # expect_warning(run.cache(sum, 1, 2, 3, 4, 5, show.message = FALSE, base.dir = 'c:/Windows'), 'Could not create cache folder inside base.dir')
  } else {
    expect_warning(run.cache(sum, 1, 2, 3, 4, 5, show.message = FALSE, base.dir = '/'), 'Could not create cache folder inside base.dir')
  }
})

test_that("run.cache base.dir in folder that does not have access", {
  if (.Platform$OS.type == 'windows') {
    # CRAN automated tests allow to write in c:/Windows
    # expect_warning(run.cache(sum, 1, 2, 3, 4, 5, show.message = FALSE, base.dir = file.path('c:', 'windows', 'caca')), 'Could not create cache base folder')
  } else {
    expect_warning(run.cache(sum, 1, 2, 3, 4, 5, show.message = FALSE, base.dir = '/daca'), 'Could not create cache base folder')
  }
})

test_that("run.cache base.dir in folder that does not have access", {
  expect_equal(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), cache.digest = list(digest.cache(1)), show.message = FALSE), 15)
})

test_that("run.cache add to hash", {
  expect_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = T, show.message = TRUE, add.to.hash = 'something'), 'Saving in cache')
  expect_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = T, show.message = TRUE, add.to.hash = 'other'), 'Saving in cache')

  one <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = F, show.message = TRUE, add.to.hash = 'something'))
  two <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = F, show.message = TRUE, add.to.hash = 'other'))
  expect_false(one == two)
})

test_that("run.cache with seed", {
  expect_output(run.cache(rnorm, 1, seed = 10, base.dir = tempdir(), force.recalc = T, show.message = TRUE), 'Saving in cache')
  expect_output(run.cache(rnorm, 1, seed = 11, base.dir = tempdir(), force.recalc = T, show.message = TRUE), 'Saving in cache')
  expect_output(rnorm10 <- run.cache(rnorm, 1, seed = 10, base.dir = tempdir(), force.recalc = F, show.message = TRUE), 'Loading from cache')
  expect_output(rnorm11 <- run.cache(rnorm, 1, seed = 11, base.dir = tempdir(), force.recalc = F, show.message = TRUE), 'Loading from cache')
  expect_false(rnorm10 == rnorm11)
})

# test_that("run.cache saves to local directory", {
#  output <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = T, show.message = TRUE))
#  expect_true(grepl(file.path('.', 'run-cache'), output))
# })

test_that("run.cache uses cache", {
  run.cache(sum, 1, 2, 3, 4, 5, force.recalc = T, show.message = FALSE)
  output <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = F, show.message = TRUE))
  expect_true(grepl('Loading from cache', output))
})

test_that("run.cache show.message option works", {
  show.message(TRUE)
  output <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = TRUE))
  expect_true(grepl('Saving in cache', output))
  output <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = TRUE, show.message = FALSE))
  expect_true(output == '')
  show.message(FALSE)
  output <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = TRUE))
  expect_true(output == '')
  output <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = tempdir(), force.recalc = TRUE, show.message = TRUE))
  expect_true(grepl('Saving in cache', output))
})

test_that("run.cache base.dir option works", {
  output1 <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = cache0, force.recalc = F, show.message = TRUE))
  output2 <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = cache1, force.recalc = F, show.message = TRUE))
  output3 <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, base.dir = cache0, force.recalc = F, show.message = TRUE))

  base.dir(cache2)
  output4 <- capture_output(run.cache(sum, 1, 2, 3, 4, 5, force.recalc = FALSE, show.message = TRUE))

  if (.Platform$OS.type == 'windows') {
    cache0.os <- gsub('\\\\', '\\\\\\\\', cache0)
    cache1.os <- gsub('\\\\', '\\\\\\\\', cache0)
    cache2.os <- gsub('\\\\', '\\\\\\\\', cache0)
  } else {
    cache0.os <- cache0
    cache1.os <- cache1
    cache2.os <- cache2
  }
  expect_true(grepl(cache0.os, output1))
  expect_true(grepl(cache1.os, output2))
  expect_true(grepl(cache0.os, output3))
  expect_true(grepl(cache2.os, output4))
})
