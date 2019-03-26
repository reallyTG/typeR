context("Scripts management")

dir <- tempdir()
setwd(dir)

if (dir.exists("project-test")) unlink("project-test", recursive = TRUE)
dir.create("project-test")
setwd("project-test")

prInit()

test_that("One can create scripts", {
  prScript("test")
  expect_true(file.exists("scripts/test.R"))
})

test_that("One can create scripts in subfolders", {
  prScript("dir1/test1")
  expect_true(file.exists("scripts/dir1/test1.R"))
  prScript("test2", subdir = "dir2")
  expect_true(file.exists("scripts/dir2/test2.R"))
})

test_that("One can move scripts", {
  prScript("test3")
  
  prMoveScript("test3", "dir3")
  expect_false(file.exists("scripts/test3.R"))
  expect_true(file.exists("scripts/dir3/test3.R"))
  
  prMoveScript("dir3/test3", ".")
  expect_false(file.exists("scripts/dir3/test3.R"))
  expect_true(file.exists("scripts/test3.R"))
})

test_that("One can rename scripts", {
  prScript("test4")
  prRenameScript("test4", "newtest4")
  expect_false(file.exists("scripts/test4.R"))
  expect_true(file.exists("scripts/newtest4.R"))
  
  prScript("dir6/test6")
  prRenameScript("dir6/test6", "newtest6")
  expect_false(file.exists("scripts/dir6/test6.R"))
  expect_true(file.exists("scripts/dir6/newtest6.R"))
})

test_that("One cannot overwrite an existing script", {
  prScript("test1")
  prScript("test2")
  prScript("dir/test1")
  
  expect_error(prRenameScript("test1", "test2"), "already exists")
  expect_error(prMoveScript("test1", "dir"), "already exists")
})

test_that("One can delete scripts", {
  prScript("test5")
  prDeleteScript("test5")
  expect_false(file.exists("scripts/test5.R"))
  
  prScript("dir7/test7")
  prDeleteScript("dir7/test7")
  expect_false(file.exists("scripts/dir7/test7.R"))
})
