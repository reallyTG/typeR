library(testthat)
library(namedCapture)
context("NA subjects")

for(engine in c("PCRE", "RE2")){
  namedCapture.engine(engine)
  test_engine <- function(msg, ...){
    test_that(paste(engine, msg), ...)
  }

  N <- 1e5
  subject.vec <- c("this will match", rep(NA, N))
  pattern <- paste0("(?P<first>ill)(?P<rest>.*)")

  test_engine("NA subjects do not cause warnings", {
    ## Sometimes the C code underly regexpr will return large ints in
    ## capture start/length for subjects with missing values, and in
    ## that case we were seeing the warning "NAs introduced by coercion
    ## to integer range." but sometimes (randomly) it did not cause a
    ## warning.
    expect_silent({
      computed.mat <- str_match_named(subject.vec, pattern)
    })
    expected.mat <- matrix(
      c("ill", " match"),
      N+1, 2, byrow=TRUE)
    expected.mat[2:nrow(expected.mat), ] <- NA
    colnames(expected.mat) <- c("first", "rest")
    expect_identical(computed.mat, expected.mat)
  })

}
