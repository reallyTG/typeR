context("lint_bib")

test_that("Correctly tidies known input", {
  # skip("Not supported in R 3.5.0.")
  
  if (file.exists("lint_bib_out.bib")) file.remove("lint_bib_out.bib")
  lint_bib("lint_bib_in.bib", "lint_bib_out.bib")
  expect_identical(readLines("lint_bib_out.bib", encoding = "UTF-8"),
                   readLines("lint_bib_out_correct.bib", encoding = "UTF-8"))
})

test_that("Correctly tidies hypercorrections", {
  # skip("Not supported in R 3.5.0.")
  
  if (file.exists("./validate-bib/invalid-hypercorrected_out.bib")) {
    file.remove("./validate-bib/invalid-hypercorrected_out.bib")
  }
  lint_bib("./validate-bib/invalid-hypercorrected.bib",
           "./validate-bib/invalid-hypercorrected_out.bib")
  expect_identical(readLines("./validate-bib/invalid-hypercorrected_out.bib", encoding = "UTF-8"),
                   readLines("./validate-bib/valid-hypercorrected.bib", encoding = "UTF-8"))
})


test_that("Resolve close brace on next line", {
  temp.bib <- tempfile(fileext = ".bib")
  lint_bib("lint-bib/sly-open-brace.bib", outfile = temp.bib)
  read_nz <- function(x) {
    o <- readLines(x, encoding = "UTF-8")
    o[nzchar(o)]
  }
  expect_identical(read_nz(temp.bib), read_nz("lint-bib/sly-open-brace-expected.bib"))
})

test_that("1000 clearance", {
  skip_if(isTRUE(getOption("TeXCheckR.verbose")))
  test1000.bib <- tempfile(fileext = ".bib")
  writeLines(c("", "@Article{", 
               "author = {the", 
               rep_len(".", 102), 
               "badger},",
               "}", ""), 
             test1000.bib)
  expect_warning(lint_bib(test1000.bib, tempfile(fileext = ".bib")))
})


