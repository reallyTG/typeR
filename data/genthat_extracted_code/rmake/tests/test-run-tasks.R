source('realRunTools.R')

test_that('tasks', {
  initTesting('tasks')
  dep11 <- 'dep1.1.in'
  dep12 <- 'dep1.2.in'
  dep2 <- 'dep2.in'
  out1 <- 'result1.out'
  out2 <- 'result2.out'
  r1 <- 'script1.R'
  r2 <- 'script2.R'
  writeToDepFile(dep11)
  writeToDepFile(dep12)
  writeToDepFile(dep2)
  createScriptFile(r1, out1)
  createScriptFile(r2, out2)
  createMakefile('library(rmake)',
                 paste0('job <- list(rRule(target="', out1, '", script="', r1, '", depends=c("', dep11, '", "', dep12, '"), task="task1"),',
                        '            rRule(target="', out2, '", script="', r2, '", depends="', dep2, '", task="task2"))'),
                 'makefile(job, "Makefile")')

  expect_true(file.exists(dep11))
  expect_true(file.exists(dep12))
  expect_true(file.exists(dep2))
  expect_false(file.exists(out1))
  expect_false(file.exists(out2))
  expect_true(file.exists(r1))
  expect_true(file.exists(r2))

  make()
  make()

  expect_true(file.exists(out1))
  expect_true(file.exists(out2))
  expect_true(contentGreater(out1, dep11))
  expect_true(contentGreater(out1, dep12))
  expect_true(contentGreater(out2, dep2))

  Sys.sleep(1)
  writeToDepFile(dep11)
  writeToDepFile(dep12)
  writeToDepFile(dep2)
  expect_false(contentGreater(out1, dep11))
  expect_false(contentGreater(out1, dep12))
  expect_false(contentGreater(out2, dep2))

  make('task1')

  expect_true(contentGreater(out1, dep11))
  expect_true(contentGreater(out1, dep12))
  expect_false(contentGreater(out2, dep2))

  Sys.sleep(1)
  writeToDepFile(dep11)
  writeToDepFile(dep12)
  writeToDepFile(dep2)
  expect_false(contentGreater(out1, dep11))
  expect_false(contentGreater(out1, dep12))
  expect_false(contentGreater(out2, dep2))

  make('task2')

  expect_false(contentGreater(out1, dep11))
  expect_false(contentGreater(out1, dep12))
  expect_true(contentGreater(out2, dep2))

  Sys.sleep(1)
  writeToDepFile(dep11)
  writeToDepFile(dep12)
  writeToDepFile(dep2)
  expect_false(contentGreater(out1, dep11))
  expect_false(contentGreater(out1, dep12))
  expect_false(contentGreater(out2, dep2))

  make()

  expect_true(contentGreater(out1, dep11))
  expect_true(contentGreater(out1, dep12))
  expect_true(contentGreater(out2, dep2))
})
