source('realRunTools.R')

test_that('simple R script', {
  initTesting('simple')
  dep1 <- 'dep1.in'
  dep2 <- 'dep2.in'
  out <- 'result.out'
  r <- 'script.R'
  writeToDepFile(dep1)
  writeToDepFile(dep2)
  createScriptFile(r, out)
  createMakefile('library(rmake)',
                 paste0('job <- list(rRule("', out, '", "', r, '", c("', dep1, '", "', dep2, '")))'),
                 'makefile(job, "Makefile")')

  expect_true(file.exists(dep1))
  expect_true(file.exists(dep2))
  expect_false(file.exists(out))
  expect_true(file.exists(r))

  make()
  make()

  expect_true(file.exists(out))
  expect_true(contentGreater(out, dep1))
  expect_true(contentGreater(out, dep2))

  Sys.sleep(1)
  writeToDepFile(dep1)
  expect_false(contentGreater(out, dep1))
  expect_true(contentGreater(out, dep2))

  make()

  expect_true(contentGreater(out, dep1))
  expect_true(contentGreater(out, dep2))

  Sys.sleep(1)
  writeToDepFile(dep2)
  expect_true(contentGreater(out, dep1))
  expect_false(contentGreater(out, dep2))

  make()

  expect_true(contentGreater(out, dep1))
  expect_true(contentGreater(out, dep2))
})
