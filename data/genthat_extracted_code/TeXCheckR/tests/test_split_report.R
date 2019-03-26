context("Splitting reports") 

test_that("split report into includes", {
  skip("Not yet implemented")
  skip_if_not_installed("readr")
  split_report("split-report/split-simple.tex",
               subdir = "abc",
               out.tex = "split-report/split-simple-test.tex")
  expect_true(file.exists("split-report/split-simple-test.tex"))
  expect_true(file.exists("split-report/split-simple-test.tex"))
  expect_true(file.exists("split-report/abc/1-First-chapter.tex"))
  
  
  expected <- readr::read_lines("split-report/split-simple-out.tex")
  actual <- readr::read_lines("split-report/split-simple-test.tex")
  expect_identical(expected, actual)
  
  expected <- readr::read_lines("split-report/abc/1-First-chapter-expect.tex")
  actual <- readr::read_lines("split-report/abc/1-First-chapter.tex")
  expect_identical(expected, actual)
  
  expected <- readr::read_lines("split-report/abc/2-Second-chapter-expect.tex")
  actual <- readr::read_lines("split-report/abc/2-Second-chapter.tex")
  expect_identical(expected, actual)
})
