context("utils")

test_that("Seq_union always length one", {
  expect_equal(Seq_union(1, 5), 1:5)
  expect_equal(Seq_union(1, c(5, 10)), 1:10)
  expect_equal(Seq_union(c(73, 100), c(83, 105)), c(73:83, 100:105))
  expect_equal(Seq_union(c(1, 10), c(9, 19)), 1:19)
})

test_that("Seq_union coverage", {
  expect_error(Seq_union(1:4, 1:5), 
               "x and y must have the same length")
  expect_equal(Seq_union(5, 1:4), 
               rev(Seq_union(1:4, 5)))
})


test_that("stringi replacements work if stringi absent", {
  skip_if_not_installed("stringi")
  Lines <- readLines("Example-report.Rnw")
  expect_identical(stri_locate_first_fixed_no_stringi(Lines, " - "), 
                   stringi::stri_locate_first_fixed(Lines, " - "))
  
  expect_identical(stri_count_fixed_no_stringi(c("ABCAB", "DABAAAABEF", "A"), "AA"), 
                   stringi::stri_count_fixed(c("ABCAB", "DABAAAABEF", "A"), "AA"))
  
  
  some_lines <- c("", "abc", "sdoifhsdfiohsdf dsfugdsfiugsdfiug", "", " X ")
  i1 <- sample.int(max(nchar(some_lines)), size = 1L)
  i2 <- sample.int(max(nchar(some_lines)), size = 1L)
  j1 <- -1L *sample.int(max(nchar(some_lines)), size = 1L)
  j2 <- -1L * sample.int(max(nchar(some_lines)), size = 1L)
  
  expect_identical(stringi::stri_sub(some_lines, i1, i2), stri_sub_no_stringi(some_lines, i1, i2))
  expect_identical(stringi::stri_sub(some_lines, j1, j1), stri_sub_no_stringi(some_lines, j1, j1))
  expect_identical(stringi::stri_sub(some_lines, i1, j1), stri_sub_no_stringi(some_lines, i1, j1))
})

test_that("nths etc", {
  expect_equal(nth_max(1:5, 2), 4)
  expect_equal(nth_max(1:5, 1), 5)
  expect_equal(nth_min(1:5, 2), 2)
  expect_equal(nth_min(1:5, 1), 1)
})

test_that("move to", {
  skip_on_cran()
  current_dir <- getwd()
  AD <- tempfile()
  BD <- tempfile()
  hutils::provide.dir(AD)
  hutils::provide.dir(BD)
  file.create(paste0(file.path(AD, "a.pdf")))
  file.create(paste0(file.path(AD, "b.tex")))
  move_to(to.dir = BD, from.dir = AD, pattern = "\\.((pdf)|(tex))$")
  expect_true(file.exists(file.path("a.pdf")))
  expect_true(file.exists(file.path("b.tex")))
  setwd(current_dir)
})

test_that("r9", {
  expect_equal(r9(1, 2, 3, 4, 5, 6, 7, 8, 9),
               paste0(1:9, collapse = ""))
})

test_that("transpose", {
  pt <-
    parse_tex(c("A{}", "B[a]{b{c}{d}}z")) %>%
    .[, .(char, tg1, tg2, og1, 
          GROUP_ID1, GROUP_ID2, 
          OPT_GROUP_ID1)]
  tempf.txt <- tempfile()
  print_transpose_data.table(pt, file = tempf.txt)
  tempf <- readLines(tempf.txt)
  expect_equal(trimws(tempf[1]), "char :A{}B[a]{b{c}{d}}z")
  expect_equal(trimws(tempf[7]), "OPT_GROUP_ID1 :....111..........")
})

test_that("write_lines", {
  write_lines(letters, tmpf <- tempfile())
  expect_equal(read_lines(tmpf), letters)
})

test_that("Fill with space", {
  expect_equal(fill_with_space("xyz>abc<012", "abc"), 
               "xyz>   <012")
  expect_equal(fill_with_space("xyz>abcdef<012", "(?:xyz>)(.+)<"), 
               "xyz>      <012")
  
  expect_equal(fill_with_space("axyz", "a(.)(.)z", group = 1L),
               "a yz")
  expect_equal(fill_with_space("axyz", "a(.)(.)z", group = 2L),
               "ax z")
  expect_equal(fill_with_space("another \\verb=sti= po sa \\verb=12345= x",
                               "(?:verb)(.)(.+?)\\1",
                               group = 2L), 
               "another \\verb=   = po sa \\verb=     = x")
  expect_equal(fill_with_space(c("another \\verb=sti= po sa \\verb=12345= x",
                                 "another \\verb!sti! po sa \\verb=12345= x"),
                               "(?:verb)(.)(.+?)\\1",
                               group = 2L), 
               c("another \\verb=   = po sa \\verb=     = x",
                 "another \\verb!   ! po sa \\verb=     = x"))
  expect_equal(fill_with_space(letters, "[b-z]"), 
               c("a", rep(" ", 25)))
  
  
  
})



