library(testthat)
library(namedCapture)
context("optional groups")

for(engine in c("PCRE", "RE2")){
  namedCapture.engine(engine)
  test_engine <- function(msg, ...){
    test_that(paste(engine, msg), ...)
  }

  subject <- 
    c(ten="chr10:213,054,000-213,055,000",
      M="chrM:111,000-222,000",
      no.match="foo bar",
      missing=NA,
      two="chr1:110-111 chr2:220-222",
      no.end="chr1:110 chr2:220-222")

  pattern <- paste0(
    "(?P<chrom>chr[^:]+)",
    ":",
    "(?P<chromStart>[^- ]+)",
    "(?:",
    "-",
    "(?P<chromEnd>[^ ]+)",
    ")?")

  test_engine("match one optional group", {
    computed.mat <- str_match_named(subject, pattern)
    expected.mat <- cbind(
      chrom=c("chr10", "chrM", NA, NA, "chr1", "chr1"),
      chromStart=c("213,054,000", "111,000", NA, NA, "110", "110"),
      chromEnd=c("213,055,000", "222,000", NA, NA, "111", ""))
    rownames(expected.mat) <- names(subject)
    expect_identical(computed.mat, expected.mat)
  })

  test_engine("match all optional groups", {
    computed.list <- str_match_all_named(subject, pattern)
    expected.list <- list(
      ten=cbind(chrom="chr10", chromStart="213,054,000", chromEnd="213,055,000"),
      M=cbind(chrom="chrM", chromStart="111,000", chromEnd="222,000"),
      no.match=matrix(character(), nrow=0),
      missing=matrix(character(), nrow=0),
      two=cbind(chrom=c("chr1", "chr2"),
                chromStart=c("110", "220"),
                chromEnd=c("111", "222")),
      no.end=cbind(chrom=c("chr1", "chr2"),
                   chromStart=c("110", "220"),
                   chromEnd=c("", "222")))
    expect_identical(computed.list, expected.list)
  })

}
