context("remove")

s <- system.file('examples/SAScode/Macros/Util2.SAS', package='sasMap')

sasCode <- loadSAS(s)

test_that("Removes multiline comments", {
  
  commentFree <- removeMultilineComments(sasCode)
 
  expect_false(stringr::str_detect(commentFree, "\\/\\*.*\\*\\/"))
  
})

test_that("Removes all comments", {
  
  commentFree <- removeAllComments(sasCode)
  
  expect_false(stringr::str_detect(commentFree, "this is a comment"))
  
})

test_that("Removes all whitespace", {
  
  noWhite <- removeWhitespaceCharacters(sasCode)

  expect_false(stringr::str_detect(noWhite, "\\\r|\\\n"))
  
})

