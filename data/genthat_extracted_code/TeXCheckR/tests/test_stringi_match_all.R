context("stringi")

test_that("stri_locate_all_regex single entry", {
  skip_if_not_installed("stringi")
  stri_oui <- 
    stringi::stri_locate_all_regex(c("\\abc{def}", "abcdef", "\\abcdef"),
                                   pattern = "\\\\abc(?![A-Za-z])")
  stri_non <- 
    stri_locate_all_regex_no_stri(c("\\abc{def}", "abcdef", "\\abcdef"), 
                                  pattern = "\\\\abc(?![A-Za-z])")
  expect_identical(stri_oui, stri_non)
})
test_that("stri_locate_all_regex multiple entries", {
  skip_if_not_installed("stringi")
  stri_oui <- 
    stringi::stri_locate_all_regex(c("\\abc{def} \\abcdef \\abc{x}"),
                                   pattern = "\\\\abc(?![A-Za-z])")
  stri_non <- 
    stri_locate_all_regex_no_stri(c("\\abc{def} \\abcdef \\abc{x}"), 
                                  pattern = "\\\\abc(?![A-Za-z])")
  expect_identical(stri_oui, stri_non)
  
})
